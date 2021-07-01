import 'package:chat_with_firebase/Components/Constant.dart';
import 'package:chat_with_firebase/Components/RoundedButton.dart';
import 'package:chat_with_firebase/Components/heroLogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'ChatScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = "RegistrationScreen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  void dispose() {
    super.dispose();
    showSpinner = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        progressIndicator:
            SpinKitDoubleBounce(color: Colors.yellow, size: 50.0),
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeroLogo(),
              SizedBox(height: 48.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) => email = value,
                decoration:
                    kTextDecoration.copyWith(hintText: "Enter Your Email"),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) => password = value,
                decoration:
                    kTextDecoration.copyWith(hintText: "Enter Your Password"),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10.0),
              RoundedButton(
                color: Colors.red,
                elevation: 5.0,
                borderRadius: 30.0,
                title: "Register",
                onPressed: () async {
                  setState(() => showSpinner = true);
                  try {
                    UserCredential newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
