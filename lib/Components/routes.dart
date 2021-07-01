import 'package:flutter/material.dart';
import 'package:chat_with_firebase/Screens/ChatScreen.dart';
import 'package:chat_with_firebase/Screens/LoginScreen.dart';
import 'package:chat_with_firebase/Screens/RegistrationScreen.dart';
import 'package:chat_with_firebase/Screens/WelcomeScreen.dart';
import 'package:chat_with_firebase/Screens/splashScreen.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  SplashScreen.id: (context) => SplashScreen(),
  WelcomeScreen.id: (context) => WelcomeScreen(),
  ChatScreen.id: (context) => ChatScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen(),
};
