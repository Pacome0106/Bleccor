// ignore_for_file: must_be_immutable

import 'package:blecor/pages/widgets/variables.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.onTap, required this.child,this.color});

  final void Function()? onTap;
  final Widget child;
  Color? color;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius_2,
          color:color ?? Theme.of(context).colorScheme.secondary ,
        ),
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
