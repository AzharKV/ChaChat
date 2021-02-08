import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {this.color,
      this.elevation,
      this.borderRadius,
      this.onPressed,
      this.title});

  final Color color;
  final double elevation;
  final double borderRadius;
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        elevation: elevation,
        borderRadius: BorderRadius.circular(borderRadius),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
