import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_one/auth.dart';
import 'package:mobile_one/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_one/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthenticationService service = AuthenticationService(FirebaseAuth.instance);

class ProfilePage extends StatefulWidget {
  final String nama;
  final String email;

  const ProfilePage({Key? key, required this.nama, required this.email})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileScreenPage();
}

class _ProfileScreenPage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 70.0,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/foto.png',
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    'Nama: ',
                    style: sepatuTextStyle,
                  )
                ],
              ),
              const SizedBox(height: 16),
              Align(
                child: Text(
                  service.getName(),
                  textAlign: TextAlign.center,
                  style: subTitleTextStyle,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    'Email: ',
                    style: sepatuTextStyle,
                  )
                ],
              ),
              const SizedBox(height: 16),
              Align(
                child: Text(
                  service.getEmail(),
                  textAlign: TextAlign.center,
                  style: emailTextStyle,
                ),
              ),
              const SizedBox(height: 100),
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
                    bool res = await service.logout();
                    if (res) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.remove("isUser");
                      await prefs.remove("user_id");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                  child: Text(
                    'Logout',
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
}
