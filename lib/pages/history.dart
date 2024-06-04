import 'package:blecor/generated/assets.dart';
import 'package:blecor/pages/exercises_detail.dart';
import 'package:blecor/pages/widgets/bold_text.dart';
import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/table.dart';
import 'package:blecor/pages/widgets/tile.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/fonctions.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List history01 = [];
  List history02 = [];
  List history03 = [];

  @override
  void initState() {
    history01 = AllFonction().getHistory01FromSharedPreferences();
    history02 = AllFonction().getHistory02FromSharedPreferences();
    history03 = AllFonction().getHistory03FromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          largeTitle: SmolText(
            text: "Historiques",
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          stretch: true,
          border: const Border(),
        ),
        //S
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmolText(
                      text: "Simulateurs".toUpperCase(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          sliver: history01.isNotEmpty ||
                  history02.isNotEmpty ||
                  history03.isNotEmpty
              ? SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (history01.isNotEmpty)
                        Column(
                          children: [
                            Tile(
                              title: simulators[0]['title'],
                              subtitle: simulators[0]['subtitle'],
                              index:  1,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TablePage(
                                      index:  1,
                                    ),
                                  ),
                                );
                              },
                            ),
                            sizedBox,
                          ],
                        ),

                      if (history02.isNotEmpty)
                        Column(
                          children: [
                            Tile(
                              title: simulators[1]['title'],
                              subtitle: simulators[1]['subtitle'],
                              index:  2,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TablePage(
                                      index:  2,
                                    ),
                                  ),
                                );
                              },
                            ),
                            sizedBox,
                          ],
                        ),
                      if (history03.isNotEmpty)
                        Column(
                          children: [
                            Tile(
                              title: simulators[2]['title'],
                              subtitle: simulators[2]['subtitle'],
                              index:  3,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TablePage(
                                      index:  3,
                                    ),
                                  ),
                                );
                              },
                            ),
                            sizedBox,
                          ],
                        ),
                    ],
                  ),
                )
              : SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        children: [
                          SizedBox(height: 80),
                          Center(
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.assetsNoData),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
