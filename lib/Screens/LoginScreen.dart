import 'package:chat_with_firebase/Components/Constant.dart';
import 'package:chat_with_firebase/Components/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'ChatScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

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
              Hero(
                tag: "logo",
                child: Image.asset("images/logo.png", height: 200.0),
              ),
              SizedBox(height: 48.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextDecoration.copyWith(
                  hintText: "Enter Your Email",
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kTextDecoration.copyWith(hintText: "Enter Your Password"),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 10.0),
              RoundedButton(
                color: Colors.red,
                elevation: 5.0,
                borderRadius: 30.0,
                onPressed: () async {
                  setState(() => showSpinner = true);
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    setState(() => showSpinner = false);
                    print(e.toString());

                    final snackBar = SnackBar(content: Text('$e'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                title: "LogIn",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
