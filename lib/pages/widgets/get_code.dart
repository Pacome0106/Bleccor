//put number of pages item from app method
import 'package:blecor/models/preferences_manager/shared_preferences.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:flutter/material.dart';

import '../exercises_detail.dart';

showDialogConfirm(BuildContext context, Map simulator, int index) {
  TextEditingController code = TextEditingController();

  onCompleted(String codeEdit) async {
    if (codeEdit == codeAccess) {
      await MyPreferences.setCode(codeEdit);
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExercisesDetail(
            title: simulator['title'],
            subtitle: simulator['subtitle'],
            exercise: simulator['question'],
            enter: simulator['enter'],
            image: simulator['image'],
            index: index + 1,
          ),
        ),
      );
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Clé incorrect !!!'),
        ),
      );
    }
  }

  //show a dialog box to ask user to confirm to remove from cart
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Entrez le code:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            sizedBox,
            sizedBox,
            TextField(
              controller: code,
              onEditingComplete: () => onCompleted(code.text),
              cursorHeight: 12,
              decoration: InputDecoration(
                hintText: 'Entrez le code...',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: borderRadius,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.0,
                  ),
                  borderRadius: borderRadius,
                )
                ,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.0,
                  ),
                  borderRadius: borderRadius,
                ),
              ),
              maxLines: null,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                letterSpacing: 0,
                fontFamily: 'Nunito',
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
      actions: [
        //cancel button
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "Annuler",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),

        //yes button
        TextButton(
          onPressed: () => onCompleted(code.text),
          child: Text(
            "Valider",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    ),
  );
}
