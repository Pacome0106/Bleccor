import 'package:blecor/generated/assets.dart';
import 'package:blecor/models/fonctions.dart';
import 'package:blecor/models/preferences_manager/shared_preferences.dart';
import 'package:blecor/pages/home_page.dart';
import 'package:blecor/pages/widgets/bold_text.dart';
import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/preferences_manager/shared.dart';

class TablePage extends StatefulWidget {
  const TablePage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  List history = [];
  List<DataColumn> columns = [];
  List<DataCell> rows = [];

  @override
  void initState() {
    if (widget.index == 1) {
      columns = [
        DataColumn(
          label: SmolText(
            text: 'N°',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'Quantité(m3)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'Taux(l/s)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: BoldText(
            text: 'Temps(s)',
            size: 14,
          ),
        ),
      ];

      history = AllFonction().getHistory01FromSharedPreferences();
    } else if (widget.index == 2){
      columns = [
        DataColumn(
          label: SmolText(
            text: 'N°',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'x(%)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'y(l/min)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'z(%)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'w(%)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'p',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: BoldText(
            text: 'Resultat',
            size: 14,
          ),
        ),
      ];
      history = AllFonction().getHistory02FromSharedPreferences();
    } else if (widget.index == 3) {
      columns = [
        DataColumn(
          label: SmolText(
            text: 'N°',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'Vo(l/s)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'CAo(mol/l)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'V(l)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'rA(*CA)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 'V1(l/s)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 't = 0, CA(mol/l)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: SmolText(
            text: 't(s)',
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: BoldText(
            text: 'CA(mol/l)',
            size: 14,
          ),
        ),
      ];
      history = AllFonction().getHistory03FromSharedPreferences();
    }
    super.initState();
  }

//Desconnected item from app method
  showDialogConfirm() {
    //show a dialog box to ask user to confirm to remove from cart
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        content: SmolText(
            text:
                "Êtes-vous sûr de vouloir vider l'historiques de ce simulateur ?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: SmolText(text: "Annuler"),
          ),

          //yes button
          MaterialButton(
            onPressed: () async {
              String key = '';
              if (widget.index == 1) {
                key = 'history_01';
              }else if(widget.index == 2){
                key = 'history_02';
              } else if (widget.index == 3) {
                key = 'history_03';
              }
              PreferencesService.instance.remove(key);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(currentIndex: 0),
                  ),
                  (route) => false);
            },
            child: SmolText(text: "Vider", color: Colors.red),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                largeTitle: SmolText(
                  text: "Resultats",
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                stretch: true,
                border: const Border(),
                leading: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FluentIcons.ios_arrow_24_regular,
                    size: 20,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                trailing: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => showDialogConfirm(),
                  child: Icon(
                    FluentIcons.delete_48_regular,
                    size: 20,
                    color: Colors.red,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      history.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                border: TableBorder.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 0.4,
                                ),
                                columnSpacing: 10,
                                headingRowColor: MaterialStateProperty.all(
                                    Theme.of(context).colorScheme.secondary),
                                columns: columns,
                                rows: history.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final item = entry.value;
                                  if (widget.index == 1) {
                                    rows = [
                                      DataCell(
                                        SmolText(
                                          text: '${index + 1}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      // Afficher l'index
                                      DataCell(
                                        SmolText(
                                          text: item.variable01.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable02.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(BoldText(
                                        text: item.result.toString(),
                                        size: 14,
                                      )),
                                    ];
                                  }else if (widget.index == 2){
                                    rows = [
                                      DataCell(
                                        SmolText(
                                          text: '${index + 1}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      // Afficher l'index
                                      DataCell(SmolText(
                                          text: item.variable01.toString())),
                                      DataCell(
                                        SmolText(
                                          text: item.variable02.toString(),
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable03.toString(),
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable04.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable05.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(BoldText(
                                        text: item.result.toString(),
                                        size: 14,
                                      )),
                                    ];
                                  } else if (widget.index == 3) {
                                    rows = [
                                      DataCell(
                                        SmolText(
                                          text: '${index + 1}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      // Afficher l'index
                                      DataCell(SmolText(
                                          text: item.variable01.toString())),
                                      DataCell(
                                        SmolText(
                                          text: item.variable02.toString(),
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable03.toString(),
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable04.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable05.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable06.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(
                                        SmolText(
                                          text: item.variable07.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      DataCell(BoldText(
                                        text: item.result.toString(),
                                        size: 14,
                                      )),
                                    ];
                                  }
                                  return DataRow(cells: rows);
                                }).toList(),
                              ),
                            )
                          : Column(
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
          ),
        ));
  }
}
