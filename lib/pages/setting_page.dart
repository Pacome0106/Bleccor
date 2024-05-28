import 'dart:io';

import 'package:blecor/models/utils.dart';
import 'package:blecor/pages/home_page.dart';
import 'package:blecor/pages/widgets/my_card.dart';
import 'package:blecor/pages/widgets/show_message.dart';
import 'package:blecor/pages/widgets/smol_text.dart';
import 'package:blecor/pages/widgets/variables.dart';
import 'package:blecor/theme/theme_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/class_manager/user.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
        content: SmolText(text: "Êtes-vous sûr de vouloir vous déconnecter ?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: SmolText(text: "Annuler"),
          ),

          //yes button
          MaterialButton(
            onPressed: () async {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            child: SmolText(text: "Déconnexion", color: Colors.red),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          largeTitle: SmolText(
            text: "Paramètre",
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
                      text: "Général".toUpperCase(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: borderRadius,
                      ),
                      child: Column(
                        children: [
                          Consumer<ThemeProvider>(
                            builder: (context, provider, child) {
                              bool theme = provider.currentTheme;
                              return myCard(
                                ontap: () => provider.changeTheme(!theme),
                                context: context,
                                fistWidget: const Icon(
                                    FluentIcons.brightness_high_48_filled),
                                title: theme ? "Clair" : "Sombre",
                                secondWidget: const Icon(
                                    FluentIcons.arrow_fit_20_regular),
                                showLast: true,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    sizedBox,
                    sizedBox,
                    SmolText(
                      text: "Support et commentaires".toUpperCase(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: borderRadius,
                      ),
                      child: Column(
                        children: [
                          myCard(
                            ontap: () {
                              showMessageDialog(
                                context,
                                title: "Contactez-nous",
                                widget: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SmolText(text: 'arthurmpela123@gmail.com'),
                                  ],
                                ),
                              );
                            },
                            context: context,
                            fistWidget: const Icon(FluentIcons.call_48_regular),
                            title: "Contactez-nous",
                            showLast: false,
                          ),
                          myCard(
                            ontap: () {
                              // donner les avis
                              storeRedirect;
                            },
                            context: context,
                            fistWidget:
                                const Icon(FluentIcons.star_half_28_regular),
                            title: "Laisser un avis",
                            showLast: false,
                          ),
                          myCard(
                            ontap: () async {
                              String link = '';
                              if (Platform.isIOS) {
                              } else if (Platform.isAndroid) {
                                link = playStoreUrl;
                              }
                              if (link.isNotEmpty) {
                                await Share.share(
                                  link,
                                  subject: "Bleccor",
                                  sharePositionOrigin: Rect.fromPoints(
                                    Offset.zero,
                                    const Offset(10, 10),
                                  ),
                                );
                              }
                            },
                            context: context,
                            fistWidget: const Icon(
                                FluentIcons.share_android_32_regular),
                            title: "Partager l'application",
                            showLast: true,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SmolText(
                      text: "Informations sur l'application".toUpperCase(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: borderRadius,
                      ),
                      child: Column(
                        children: [
                          myCard(
                            ontap: () {
                              showMessageDialog(
                                context,
                                title: "Bleccor",
                                widget: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: SmolText(
                                    text:
                                        """Bleccor est une entreprise privée d’ingénierie et un bureau s’études de droit congolais ayant son siège social à Kinshasa avec ses succursales à l’intérieur du pays, laquelle avec ses partenaires offre ses multi-services aux clients dans les domaines de l’Energie (études, planification et gestion des projets, installations de systèmes électriques à sources renouvelables, formation de qualité, renforcement des capacités…), de Mines, de Génie de Procédés et de l’Environnement.""",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            },
                            context: context,
                            fistWidget:
                                const Icon(FluentIcons.phone_48_regular),
                            title: "Informations sur l'application",
                            showLast: false,
                          ),
                          myCard(
                            ontap: () {
                              myLaunchUrl(privacyUrl);
                            },
                            context: context,
                            fistWidget:
                                const Icon(FluentIcons.shield_error_24_regular),
                            title: "Politique de confidentialité",
                            showLast: false,
                          ),
                          myCard(
                            ontap: () {
                              myLaunchUrl(termsAndConditions);
                            },
                            context: context,
                            fistWidget: const Icon(
                                FluentIcons.book_question_mark_24_regular),
                            title: "Conditions générales",
                            showLast: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
