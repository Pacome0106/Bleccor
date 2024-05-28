import 'package:blecor/pages/widgets/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/fonctions.dart';

Widget textField({
  required BuildContext context,
  required TextEditingController controller,
  required String placeholder,
  required Widget prefix,
  var maxLine  = 1,
  TextAlign alignment = TextAlign.start,
  required Function()? onEditingComplete,
  Function()? onTap,
   required bool number,
}) {
  return CupertinoTextField(
    controller: controller,
    maxLines: maxLine,
    minLines: 1,
    textAlign: alignment,
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      borderRadius: borderRadius,
    ),
    placeholder: placeholder,
    style: TextStyle(
      color: Theme.of(context).colorScheme.onSecondary,
      fontFamily: 'DMSans',
    ),
    placeholderStyle: TextStyle(
      color: Theme.of(context).colorScheme.onSecondary,
      fontSize: 14,
      fontFamily: 'DMSans',
      decoration: TextDecoration.none,
      letterSpacing: 0,
    ),
    keyboardType: number ? TextInputType.number:null,
    prefix: prefix,
    onEditingComplete: onEditingComplete,
    onTap: onTap,
  );
}
