import 'package:blecor/pages/widgets/bold_text.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'smol_text.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.index,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: borderRadius_2,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).focusColor,
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 9),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 30,
                  child: Center(
                    child: SmolText(
                      text: index.toString(),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BoldText(
                      text: title.toUpperCase(),
                      size: 14,
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        subtitle,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        // Ajout de l'overflow
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          letterSpacing: 0,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    // SmolText(text: subtitle),
                  ],
                ),
                const Icon(FluentIcons.ios_chevron_right_20_regular)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
