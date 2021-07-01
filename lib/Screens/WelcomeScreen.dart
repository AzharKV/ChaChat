import 'package:chat_with_firebase/Components/RoundedButton.dart';
import 'package:chat_with_firebase/Components/animatedText.dart';
import 'package:chat_with_firebase/Components/heroLogo.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'RegistrationScreen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "WelcomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [HeroLogo(), TypeWriterAnimatedText()]),
            SizedBox(height: 20.0),
            RoundedButton(
                color: Colors.lightBlueAccent,
                elevation: 4.0,
                borderRadius: 30.0,
                title: "LogIn",
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id)),
            RoundedButton(
                color: Colors.lightBlue,
                elevation: 4.0,
                borderRadius: 30.0,
                title: "Register",
                onPressed: () =>
                    Navigator.pushNamed(context, RegistrationScreen.id)),
          ],
        ),
      ),
    );
  }
}
