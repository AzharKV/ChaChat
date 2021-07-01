import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_with_firebase/Screens/ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  static const String id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final User user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      if (user == null) Navigator.pushNamed(context, LoginScreen.id);

      if (user != null) Navigator.pushNamed(context, ChatScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
                tag: "logo",
                child: Image.asset("images/logo.png", height: 70.0)),
            TypewriterAnimatedTextKit(
              onTap: () {},
              text: ["Flash Chat"],
              textStyle: TextStyle(
                  fontSize: 30.0,
                  fontFamily: "Agne",
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              speed: Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
    );
  }
}
