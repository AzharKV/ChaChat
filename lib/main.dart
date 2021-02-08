import 'package:flutter/material.dart';
import 'Screens/ChatScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegistrationScreen.dart';
import 'Screens/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        },
        initialRoute: WelcomeScreen.id);
  }
}
