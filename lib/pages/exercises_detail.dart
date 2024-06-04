import 'package:blecor/generated/assets.dart';
import 'package:blecor/models/class_manager/history_1.dart';
import 'package:blecor/models/class_manager/history_2.dart';
import 'package:blecor/models/preferences_manager/shared_preferences.dart';
import 'package:blecor/pages/widgets/bold_text.dart';
import 'package:blecor/pages/widgets/my_button.dart';
import 'package:blecor/pages/widgets/my_text_field.dart';
import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/class_manager/history_3.dart';
import '../models/fonctions.dart';

class ExercisesDetail extends StatefulWidget {
  const ExercisesDetail({
    super.key,
    required this.subtitle,
    required this.exercise,
    required this.enter,
    required this.image,
    required this.index,
  });

  final String subtitle;
  final String exercise;
  final String enter;
  final String image;
  final int index;

  @override
  State<ExercisesDetail> createState() => _ExercisesDetailState();
}

class _ExercisesDetailState extends State<ExercisesDetail> {
  TextEditingController inPut = TextEditingController();
  TextEditingController initialVolume = TextEditingController();
  TextEditingController v0 = TextEditingController();
  TextEditingController ca0 = TextEditingController();
  TextEditingController ra = TextEditingController();
  TextEditingController v1 = TextEditingController();
  TextEditingController cA0 = TextEditingController();
  TextEditingController temps = TextEditingController();

  // exesice 3
  TextEditingController w = TextEditingController();
  TextEditingController x = TextEditingController();
  TextEditingController y = TextEditingController();
  TextEditingController z = TextEditingController();
  TextEditingController p = TextEditingController();

  bool allView = false;
  bool isResult = false;
  bool isSave = false;
  String result = '';

  @override
  void initState() {
    if (widget.index == 1) {
      initialVolume.text = widget.enter;
    } else if (widget.index == 2) {
      x.text = "45";
      y.text = "2000";
      z.text = "99";
      w.text = "2";
      p.text = "0.85";
    } else {
      initialVolume.text = "10";
      v0.text = "0.15";
      ca0.text = "10";
      ra.text = "0.005";
      v1.text = "0.15";
      cA0.text = "2.0";
    }
    super.initState();
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
                text: "Exercice",
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
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    sizedBox,
                    SmolText(
                      text: widget.subtitle.toUpperCase(),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    sizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldText(text: "Intitulé", size: 16),
                        GestureDetector(
                          onTap: () {
                            setState(() => allView = !allView);
                          },
                          child: Row(
                            children: [
                              SmolText(
                                text:
                                    !allView ? "Tout afficher" : "Masquer tout",
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Icon(
                                !allView
                                    ? CupertinoIcons.chevron_compact_down
                                    : CupertinoIcons.chevron_compact_up,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    sizedBox,
                    if (allView) SmolText(text: widget.exercise),
                    sizedBox,
                    widget.index == 1
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  SmolText(text: "°"),
                                  const Expanded(child: SizedBox()),
                                  BoldText(text: 'l/s', size: 20),
                                  SizedBox(
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: textField(
                                        context: context,
                                        alignment: TextAlign.center,
                                        controller: inPut,
                                        placeholder: "Entrez la valeur ",
                                        prefix: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 0.0, bottom: 0.0),
                                          child: SizedBox(
                                            height: 30,
                                          ),
                                        ),
                                        onEditingComplete: () {
                                          AllFonction().closeKeyboard(context);
                                        },
                                        onTap: () {
                                          setState(() => isResult = false);
                                        },
                                        number: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              sizedBox,
                              Row(
                                children: [
                                  SmolText(text: "° X"),
                                  const Expanded(child: SizedBox()),
                                  BoldText(text: 'm3', size: 20),
                                  SizedBox(
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: textField(
                                        context: context,
                                        alignment: TextAlign.center,
                                        controller: initialVolume,
                                        placeholder: "Entrez la valeur ",
                                        prefix: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 0.0, bottom: 0.0),
                                          child: SizedBox(
                                            height: 30,
                                          ),
                                        ),
                                        onEditingComplete: () {
                                          AllFonction().closeKeyboard(context);
                                        },
                                        onTap: () {
                                          setState(() => isResult = false);
                                        },
                                        number: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : widget.index == 2
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      SmolText(text: "° x"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: '%', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: x,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° y"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: 'l/min', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: y,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° z"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: '%', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: z,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° w"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: '%', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: w,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° p"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: '', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: p,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      SmolText(text: "° Vo"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: 'l/s', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: v0,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° CAo"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: 'mol/l', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: ca0,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° V"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: 'l', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: initialVolume,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° rA"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: '*CA', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: ra,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° V1"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: 'l/s', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: v1,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() => isResult = false);
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SmolText(
                                          text:
                                              "° Avec t = 0, comme condition initiale CA"),
                                      sizedBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          BoldText(text: 'mol/l', size: 20),
                                          SizedBox(
                                            width: 150,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: textField(
                                                context: context,
                                                alignment: TextAlign.center,
                                                controller: cA0,
                                                placeholder:
                                                    "Entrez la valeur ",
                                                prefix: const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 0.0, bottom: 0.0),
                                                  child: SizedBox(
                                                    height: 30,
                                                  ),
                                                ),
                                                onEditingComplete: () {
                                                  AllFonction()
                                                      .closeKeyboard(context);
                                                },
                                                onTap: () {
                                                  setState(() {
                                                    isResult = false;
                                                    isSave = false;
                                                  });
                                                },
                                                number: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  sizedBox,
                                  Row(
                                    children: [
                                      SmolText(text: "° t"),
                                      const Expanded(child: SizedBox()),
                                      BoldText(text: 's', size: 20),
                                      SizedBox(
                                        width: 150,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: textField(
                                            context: context,
                                            alignment: TextAlign.center,
                                            controller: temps,
                                            placeholder: "Entrez la valeur ",
                                            prefix: const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 0.0, bottom: 0.0),
                                              child: SizedBox(
                                                height: 30,
                                              ),
                                            ),
                                            onEditingComplete: () {
                                              AllFonction()
                                                  .closeKeyboard(context);
                                            },
                                            onTap: () {
                                              setState(() {
                                                isResult = false;
                                                isSave = false;
                                              });
                                            },
                                            number: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                    sizedBox,
                    sizedBox,
                    BoldText(text: "Représentation", size: 16),
                    Hero(
                      tag: widget.subtitle + widget.index.toString(),
                      child: Container(
                        height: 300,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                          ),
                        ),
                      ),
                    ),
                    sizedBox,
                    sizedBox,
                    !isResult
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                onTap: () {
                                  if (widget.index == 1) {
                                    AllFonction().closeKeyboard(context);
                                    double time = AllFonction().findT(
                                      (double.parse(initialVolume.text) * 1000),
                                      inPut.text,
                                    );

                                    print(time);
                                    String timeString = AllFonction()
                                        .convertSecondsToTime(time);
                                    setState(() {
                                      isResult = true;
                                      result = timeString;
                                    });
                                    print("==========> time :$timeString");
                                  } else if (widget.index == 2) {
                                    double X = double.parse(x.text);
                                    double Y = double.parse(y.text);
                                    double Z = double.parse(z.text);
                                    double W = double.parse(w.text);
                                    double P = double.parse(p.text);
                                    setState(() {
                                      isResult = true;
                                      result = AllFonction()
                                          .calculateB6T6B7T7(Y, X, Z, W, P);
                                    });
                                    print("========> result $result");
                                  } else {
                                    double x = double.parse(initialVolume.text);
                                    double y = double.parse(v0.text) *
                                        double.parse(ca0.text);
                                    double z = double.parse(v1.text) +
                                        (double.parse(ra.text) *
                                            double.parse(initialVolume.text));
                                    double k = double.parse(cA0.text);
                                    double t = double.parse(temps.text);
                                    double caValue = AllFonction()
                                        .calculateCa(x, y, z, t, k);
                                    setState(() {
                                      isResult = true;
                                      result =
                                          AllFonction().doubleToString(caValue);
                                    });
                                    print("=======> $caValue");
                                  }
                                },
                                child: SmolText(
                                  text: "Calculer",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.index == 1
                                  ? SmolText(text: 'Le temps est: ')
                                  : widget.index == 2
                                      ? SmolText(
                                          text:
                                              'Le débit massique de chaque constituant dans le distillat (overhead stream) et le condensat (bottom stream) sont: ',
                                        )
                                      : SmolText(
                                          text:
                                              'La concentration de A pour un processus non-transitoire(CA) est:  ',
                                        ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  BoldText(
                                    text:
                                        "$result ${widget.index == 3 ? 'mol/l' : ''}",
                                    size: 16,
                                  ),
                                ],
                              ),
                            ],
                          ),
                    sizedBox,
                    sizedBox,
                    if (isResult && !isSave)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyButton(
                            onTap: () {
                              DateTime now = DateTime.now();
                              if (widget.index == 1) {
                                HistoryData1 historyData1 = HistoryData1(
                                  title: widget.subtitle,
                                  date: now.toString(),
                                  variable01: initialVolume.text,
                                  variable02: inPut.text,
                                  result: result,
                                );
                                AllFonction().addHistory01(historyData1);
                              } else if (widget.index == 2) {
                                HistoryData2 historyData2 = HistoryData2(
                                  title: widget.subtitle,
                                  date: now.toString(),
                                  variable01: x.text,
                                  variable02: y.text,
                                  variable03: z.text,
                                  variable04: w.text,
                                  variable05: p.text,
                                  result: result,
                                );
                                AllFonction().addHistory02(historyData2);
                              } else if (widget.index == 3) {
                                HistoryData3 historyData3 = HistoryData3(
                                  title: widget.subtitle,
                                  date: now.toString(),
                                  variable01: initialVolume.text,
                                  variable02: v0.text,
                                  variable03: ca0.text,
                                  variable04: ra.text,
                                  variable05: v1.text,
                                  variable06: cA0.text,
                                  variable07: temps.text,
                                  result: result,
                                );
                                AllFonction().addHistory03(historyData3);
                              }
                              setState(() => isSave = true);
                            },
                            child: SmolText(
                              text: "Enregistrer",
                              color: Theme.of(context).colorScheme.onBackground,
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
      ),
    );
  }
}
