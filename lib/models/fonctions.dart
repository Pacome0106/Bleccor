import 'dart:convert';

import 'package:blecor/models/class_manager/history_1.dart';
import 'package:blecor/models/class_manager/history_2.dart';
import 'package:blecor/models/preferences_manager/shared.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AllFonction {

  String doubleToString(double value) {
    return value.toStringAsFixed(2);
  }
  // -------- fonction pour fermer un textField-------
  void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  String convertSecondsToTime(double seconds) {
    int hours = (seconds / 3600).floor();
    int minutes = ((seconds % 3600) / 60).floor();
    int remainingSeconds = (seconds % 60).floor();

    String hourSuffix = ' h';
    String minuteSuffix =  ' min' ;
    String secondSuffix = ' sec' ;

    String timeString = '$hours$hourSuffix : ${minutes.toString().padLeft(2, '0')}$minuteSuffix : ${remainingSeconds.toString().padLeft(2, '0')}$secondSuffix';
    return timeString;
  }


  double findT(double x, dynamic y) {
    double t;
    if (y is String && y.contains('t')) {
      // Extraire le coefficient de la chaîne et le diviser par x
      double coefficient = double.parse(y.replaceAll('t', ''));
      t = sqrt(2 * x / coefficient);
    } else {
      t = x / double.parse(y);
    }

    // Si t est négatif, il n'y a pas de solution réelle
    if (t < 0) {
      throw ArgumentError('Il n\'y a pas de solution réelle pour t.');
    }

    // Retourner la valeur de t
    return t;
  }

  double calculateCa(double x,double y, double z, double t,  double ca0) {

    double ca =(y/z) +(ca0-(y/z))*exp(-z*t);

    return ca;
  }
  // -------- add a history01 to dataBase ----------
  Future<void> addHistory01(HistoryData1 item) async {
    final List<HistoryData1> history = getHistory01FromSharedPreferences();

    // Ajouter une history01 au stockage
    history.add(item);
    await saveHistory01ToSharedPreferences(history);
  }

  // -------- History01 to dataBase ------------
  Future<void> saveHistory01ToSharedPreferences(List<HistoryData1> history)async{
    List<String> historyItem = history.map((item) => json.encode(item.toMap())).toList();
    await PreferencesService.instance.setStringList('history_01', historyItem);
  }


  // -------- add a history01 to dataBase ----------
  Future<void> addHistory02(HistoryData2 item) async {
    final List<HistoryData2> history = getHistory02FromSharedPreferences();

    // Ajouter une history02 au stockage
    history.add(item);
    await saveHistory02ToSharedPreferences(history);
  }

  // -------- History02 to dataBase ------------
  Future<void> saveHistory02ToSharedPreferences(List<HistoryData2> history)async{
    List<String> historyItem = history.map((item) => json.encode(item.toMap())).toList();
    await PreferencesService.instance.setStringList('history_02', historyItem);
  }

    // --------- get all history01 to dataBase ---------
  List<HistoryData1> getHistory01FromSharedPreferences()  {
    List<String>? historyJsonList = PreferencesService.instance.getStringList('history_01');

    if (historyJsonList == null) return [];

    return historyJsonList.map((historyJson) {
      Map<String, dynamic> historyMap = json.decode(historyJson);
      return HistoryData1.fromMap(historyMap, historyMap['id'] ?? '');
    }).toList();
  }

  // --------- get all history02 to dataBase ---------
  List<HistoryData2> getHistory02FromSharedPreferences()  {
    List<String>? historyJsonList = PreferencesService.instance.getStringList('history_02');

    if (historyJsonList == null) return [];

    return historyJsonList.map((historyJson) {
      Map<String, dynamic> historyMap = json.decode(historyJson);
      return HistoryData2.fromMap(historyMap, historyMap['id'] ?? '');
    }).toList();
  }

  //  ------ Fontion to clear sharedPreferences -------------
  Future<void> clearSharedPreferences() async {
    // Utiliser SharedPreferences pour effacer toutes les données
    await PreferencesService.instance.clear();
  }
}
