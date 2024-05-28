import 'package:flutter/material.dart';

// class du widget qui possede le text en gras et la grande police
// ignore: must_be_immutable
class BoldText extends StatelessWidget {
  BoldText({
    super.key,
    this.size = 20,
    this.color,
    required this.text,
  });
  Color? color;
  double size;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Montserrat',
        color: color,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        decoration: TextDecoration.none,
      ),
    );
  }
}
