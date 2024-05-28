import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:flutter/material.dart';

import 'bold_text.dart';
import 'lign.dart';



/// Message Dialog widget function
/// [context] is the context of the widget
/// [title] is the title of the dialog
/// [message] is the message of the dialog
Future<void> showMessageDialog(BuildContext context,
    {required String title, required Widget widget}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BoldText(text: title),
              const SizedBox(
                height: 10,
              ),
              widget,
              const SizedBox(
                height: 20,
              ),
              const Lign(indent: 0, endIndent: 0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: SmolText(text: 'Ok'),
              ),
            ],
          ),
        ),
      );
    },
  );
}





