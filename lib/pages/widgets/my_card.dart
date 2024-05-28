
import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'lign.dart';

Widget myCard({
  required BuildContext context,
  required Function() ontap,
  required Widget fistWidget,
  required String title,
  Widget secondWidget = const Icon(FluentIcons.ios_chevron_right_20_regular),
  bool showLast = false,
}) {
  return InkWell(
    onTap: ontap,
    child: Column(
      children: [
        ListTile(
          leading: fistWidget,
          title: Container(
            alignment: Alignment.centerLeft,
            child: SmolText(
              text: title,
            ),
          ),
          trailing: secondWidget,
          // subtitle: Container(),
        ),
        if (!showLast)
       const Lign(indent: 60, endIndent: 0)
      ],
    ),
  );
}
