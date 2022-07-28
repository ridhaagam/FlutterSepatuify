import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_one/auth.dart';
import 'package:mobile_one/pages/main_page.dart';
import 'package:mobile_one/pages/register_page.dart';
import 'package:mobile_one/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_one/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   @override
  void initState() {
    super.initState();
    loginCheck();
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();
  loginCheck() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("isUser") != null && prefs.getBool("isUser") == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }
  
  FailedLogin(BuildContext context) {  
  // Create button  
  Widget button = TextButton(  
    child: const Text("Close"),  
    onPressed: () {  
      Navigator.of(context).pop();  
    },  
  );  
  
  // Create AlertDialog  
  AlertDialog alert = AlertDialog(  
    title: const Text("GAGAL"),  
    content: const Text("Username atau password SALAH"),  
    actions: [  
      button,  
    ],  
  );  
  
  // show the dialog  
  showDialog(  
    context: context,  
    builder: (BuildContext context) {  
      return alert;  
    },  
  );  
}  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 50.0,
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: subTitleTextStyle,
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icon1.png',
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Align(
                child: Text(
                  'Sepatuify',
                  textAlign: TextAlign.center,
                  style: title,
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Color(0xff4141A4)),
                        ),
                        hintText: ''),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _pass,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: const Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Color(0xff4141A4)),
                        ),
                        hintText: ''),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 400,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff4141A4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66))),
                  onPressed: () async {
                     AuthenticationService service =
                        AuthenticationService(FirebaseAuth.instance);
                    bool res = await service.signIn(
                        email: _username.text, password: _pass.text);
                    if (res) {
                      final prefs = await SharedPreferences.getInstance();
                      var user = await service.getCurrentUser();
                      prefs.setBool("isUser", true);
                      prefs.setString("displayName", user.displayName);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: buttonTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 400,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xffB3B5C4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66))),
                  onPressed: () {
                       Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RegisterScreen()));// Next route
                  },
                  child: Text(
                    'Daftarkan Diri',
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_cekUsers()) {
      saveUser(_username.text, _pass.text);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      for (var item in DummyData.data) {
        if (item.containsValue(_username.text) &&
            item.containsValue(_pass.text)) {
          prefs.setInt("user_id", item["id"]);
        }
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      FailedLogin(context);  
    }
  }

  void saveUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isUser', true);
  }

  bool _cekUsers() {
    for (Map<String, dynamic> item in DummyData.data) {
      if (item["username"] == _username.text &&
          item["password"] == _pass.text) {
        return true;
      }
    }
    return false;
  }
}
