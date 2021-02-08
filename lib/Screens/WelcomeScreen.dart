import 'package:chat_with_firebase/Components/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'LoginScreen.dart';
import 'RegistrationScreen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: "logo",
                  child: Image.asset("images/logo.png", height: 70.0),
                ),
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
            SizedBox(height: 20.0),
            RoundedButton(
              color: Colors.lightBlueAccent,
              elevation: 4.0,
              borderRadius: 30.0,
              title: "LogIn",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.lightBlue,
              elevation: 4.0,
              borderRadius: 30.0,
              title: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
