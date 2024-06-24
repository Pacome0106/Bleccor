import 'package:flutter/material.dart';

// class du widget qui possede le text en gras et la grande police
// ignore: must_be_immutable
class BoldText extends StatelessWidget {
  BoldText({
    super.key,
    this.size = 20,
    this.color,
    this.maxLines,
    this.decoration,
    required this.text,
  });
  Color? color;
  double size;
  int? maxLines ;
  final String? text;
  TextDecoration? decoration = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Montserrat',
        color: color,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        decoration: decoration,
      ),
    );
  }
}
