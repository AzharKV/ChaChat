import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TypeWriterAnimatedText extends StatelessWidget {
  const TypeWriterAnimatedText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
      onTap: () {},
      text: ["Flash Chat"],
      textStyle: TextStyle(
          fontSize: 30.0,
          fontFamily: "Agne",
          color: Colors.black87,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
      speed: Duration(milliseconds: 100),
    );
  }
}
