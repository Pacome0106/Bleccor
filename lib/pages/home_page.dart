import 'package:blecor/generated/assets.dart';
import 'package:blecor/models/fonctions.dart';
import 'package:blecor/pages/exercises_detail.dart';
import 'package:blecor/pages/history.dart';
import 'package:blecor/pages/search_screen.dart';
import 'package:blecor/pages/setting_page.dart';
import 'package:blecor/pages/widgets/bold_text.dart';
import 'package:blecor/pages/widgets/my_button.dart';
import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/tile.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, this.currentIndex = 1});

  int currentIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 1;

  @override
  void initState() {
    currentIndex = widget.currentIndex;
    // checkInternetConnectivity();
    //get fonction to verify update
    advancedStatusCheck(newVersion);
    super.initState();
  }

  // --------- fonction to verify a update ----------------
  advancedStatusCheck(NewVersionPlus newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      if (status.localVersion != status.storeVersion) {
        // debugPrint(status.releaseNotes);
        // debugPrint(status.appStoreLink);
        debugPrint(status.localVersion);
        debugPrint(status.storeVersion);
        // debugPrint(status.canUpdate.toString());
        if (!context.mounted) return;
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          updateButtonText: "Installer",
          dismissButtonText: "Plus tard",
          dialogTitle: "Mise à jour disponible",
          dialogText:
              "Nous sommes ravis de vous présenter la version ${status.storeVersion} de notre application, qui apporte de nombreuses améliorations et fonctionnalités par rapport à la version précédente (version ${status.localVersion})",
          launchModeVersion: LaunchModeVersion.external,
          allowDismissal: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            currentIndex == 1
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyButton(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(simulators),
                            ),
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                          child: Icon(
                            FluentIcons.search_48_regular,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        sizedBox,
                        sizedBox,
                       Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoldText(
                                      text: "Bleccor",
                                      size: 30,
                                    ),
                                    sizedBox,
                                    sizedBox,
                                    Expanded(
                                      child: GridView.builder(
                                        itemCount: simulators.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10,
                                                childAspectRatio: 0.8),
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ExercisesDetail(
                                                  title: simulators[index]
                                                      ['title'],
                                                  subtitle: simulators[index]
                                                  ['subtitle'],
                                                  exercise: simulators[index]
                                                      ['question'],
                                                  enter: simulators[index]
                                                      ['enter'],
                                                  image: simulators[index]
                                                      ['image'],
                                                  index: index + 1,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius: borderRadius,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 5,
                                                  blurRadius: 15,
                                                  offset: const Offset(0, 9),
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              children: [
                                                BoldText(
                                                    text: simulators[index]
                                                        ['title'],
                                                    size: 14),
                                                sizedBox,
                                                SmolText(
                                                    text: simulators[index]
                                                        ['subtitle']),
                                                sizedBox,
                                                Hero(
                                                  tag: simulators[index]
                                                          ['subtitle'] +
                                                      (index + 1).toString(),
                                                  child: Container(
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            simulators[index]
                                                                ['image']),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  )
                : currentIndex == 2
                    ? SettingPage()
                    : HistoryPage(),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: borderRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() => currentIndex = 0);
                      // AllFonction().clearSharedPreferences();
                    },
                    child: Container(
                      width: currentIndex == 0 ? 80 : null,
                      padding: const EdgeInsets.all(10),
                      decoration: currentIndex == 0
                          ? BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: borderRadius_2,
                            )
                          : null,
                      child: Icon(
                        FluentIcons.apps_list_24_regular,
                        color: currentIndex == 0
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() => currentIndex = 1);
                    },
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: currentIndex == 1
                          ? BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: borderRadius_2,
                            )
                          : null,
                      child: Icon(
                        FluentIcons.home_48_regular,
                        color: currentIndex == 1
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() => currentIndex = 2);
                    },
                    child: Container(
                      width: currentIndex == 2 ? 80 : null,
                      padding: const EdgeInsets.all(10),
                      decoration: currentIndex == 2
                          ? BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: borderRadius_2,
                            )
                          : null,
                      child: Icon(
                        FluentIcons.settings_48_regular,
                        color: currentIndex == 2
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
