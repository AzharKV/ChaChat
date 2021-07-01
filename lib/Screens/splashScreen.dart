import 'dart:async';
import 'package:chat_with_firebase/Components/animatedText.dart';
import 'package:chat_with_firebase/Components/heroLogo.dart';
import 'package:chat_with_firebase/Screens/ChatScreen.dart';
import 'package:chat_with_firebase/Screens/WelcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    Timer(Duration(milliseconds: 1500), () {
      if (user == null) Navigator.pushNamed(context, WelcomeScreen.id);

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
            HeroLogo(),
            TypeWriterAnimatedText(),
          ],
        ),
      ),
    );
  }
}
