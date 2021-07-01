import 'package:flutter/material.dart';

class HeroLogo extends StatelessWidget {
  const HeroLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "logo", child: Image.asset("images/logo.png", height: 70.0));
  }
}
