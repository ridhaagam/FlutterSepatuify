import 'dart:async';

import 'package:mobile_one/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:mobile_one/pages/login_page.dart';
import 'package:mobile_one/theme.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/logo.png',
                height: 265,
                width: 265,
              ),
              padding: const EdgeInsets.only(top: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Sepatuify',
              style: logoText,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            )
          ],
        ),
      ),
    );
  }
}
