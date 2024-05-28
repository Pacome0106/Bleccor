import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Loading dialog widget function
/// [context] is the context of the widget
/// return [Future<void>]
Future<void> showLoadingDialog(BuildContext context,
    {String? message, bool isCharging = false, double progress = 0.0}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .colorScheme
                .background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              isCharging
                  ? CircularProgressIndicator(
                value: progress,
              )
                  : const CupertinoActivityIndicator(
                radius: 15,
              ),
              const SizedBox(width: 30),
              SmolText(text: message ?? "Chargement"),
            ],
          ),
        ),
      );
    },
  );
}

/// Close dialog widget function
Future<void> closeLoadingDialog(BuildContext context) async {
  return Navigator.of(context).pop();
}

// page qui possede une fonction de bloc de notiffication
void notification(BuildContext context, String text, double height) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      elevation: 0,
      duration: const Duration(seconds: 3),
      content: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: borderRadius_2,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        child: Center(
          child: SmolText(
            text: text,
            color:Theme.of(context).colorScheme.onSecondary ,
          ),
        ),
      ),
    ),
  );
}


