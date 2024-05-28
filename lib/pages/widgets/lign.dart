import 'package:flutter/material.dart';

//page qui posside une class qui m'offret une ligne de separation
class Lign extends StatelessWidget {
  final double indent;
  final double endIndent;
  const Lign({super.key, required this.indent, required this.endIndent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(left: indent, right: endIndent),
      height: 0.2,
      width: MediaQuery.of(context).size.width * 1.8,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }
}
