import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTextDecoration = InputDecoration(
  hintText: "",
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      borderSide: BorderSide(color: Colors.blue, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      borderSide: BorderSide(color: Colors.lightBlue, width: 4.0)),
);

const kMessageContainer = BoxDecoration(
    border: Border(
        top: BorderSide(
  color: Colors.lightBlueAccent,
  width: 2.0,
)));

const kMessageTextField = InputDecoration(
  hintText: "Type Your Message Here...",
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
);

const kSendButton = TextStyle(
    color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 19.0);
