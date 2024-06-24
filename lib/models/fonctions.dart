import 'dart:convert';

import 'package:blecor/models/class_manager/history_1.dart';
import 'package:blecor/models/class_manager/history_2.dart';
import 'package:blecor/models/class_manager/history_3.dart';
import 'package:blecor/models/preferences_manager/shared.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'class_manager/history_4.dart';

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
    String minuteSuffix = ' min';
    String secondSuffix = ' sec';

    String timeString =
        '$hours$hourSuffix : ${minutes.toString().padLeft(2, '0')}$minuteSuffix : ${remainingSeconds.toString().padLeft(2, '0')}$secondSuffix';
    return timeString;
  }

  // -------- function to calcul 1 exercise ----------
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

  // -------- function to calcul 2 exercise ----------
  String calculateB6T6B7T7(double y, double x, double z, double w, double p) {
    double rho = 1.0;
    double X = x / 100;
    double Z = z / 100;
    double W = w / 100;
    double Y = y * p;
    // Calculer D'
    double D1 = (X - W) * rho * Y / (Z - W);

    // Calculer W'
    double W1 = rho * Y - D1;

    String B6 = AllFonction().doubleToString(D1 * Z);
    String B7 = AllFonction().doubleToString(W1 * W);

    String T6 = AllFonction().doubleToString(D1 - (D1 * Z));
    String T7 = AllFonction().doubleToString(W1 - (W1 * W));

    return """B6: $B6 (kg/min) / T6: $T6 (kg/min)
B7: $B7 (kg/min) / T7: $T7 (kg/min)""";
  }

  // -------- function to calcul 3 exercise ----------
  double calculateCa(double x, double y, double z, double t, double ca0) {
    double ca = (y / z) + (ca0 - (y / z)) * exp(-z * t);

    return ca;
  }

  // -------- function to calcul 4 exercise ----------
  String calculateD1D2L(
    double pe,
    double q,
    double dh,
    double z1,
    double n,
    double j,
    double f,
  ) {
    double v1 =
        sqrt(((-pe / (n * 1000 * q * 9.81)) + dh + z1 - (j * dh)) / 0.110525);
    double v2 = v1 / 0.5625;
    double d1 = sqrt((4 * q) / (3.14 * v1));
    double d2 = (3 * d1) / 4;
    double d = (d1 + d2) / 2;
    double v = (v1+v2)/2;
    double k = (v*v)/19.62;
    double l = ((j*dh*d)/(f*k));

    print(v1);
    print(v2);
    print(d1);
    print(d2);
    print(l);
    String V1 = AllFonction().doubleToString(v1);
    String V2 = AllFonction().doubleToString(v2);

    String D1 = AllFonction().doubleToString(d1);
    String D2 = AllFonction().doubleToString(d2);
    String L = AllFonction().doubleToString(l);

    return """v1: $V1 (m/s) / v2: $V2 (m/s)
d1: $D1 (m) / d2: $D2 (m)
L $L (m)""";
  }

  // -------- add a history01 to dataBase ----------
  Future<void> addHistory01(HistoryData1 item) async {
    final List<HistoryData1> history = getHistory01FromSharedPreferences();

    // Ajouter une history01 au stockage
    history.add(item);
    await saveHistory01ToSharedPreferences(history);
  }

  // -------- History01 to dataBase ------------
  Future<void> saveHistory01ToSharedPreferences(
      List<HistoryData1> history) async {
    List<String> historyItem =
        history.map((item) => json.encode(item.toMap())).toList();
    await PreferencesService.instance.setStringList('history_01', historyItem);
  }

  // -------- add a history02 to dataBase ----------
  Future<void> addHistory02(HistoryData2 item) async {
    final List<HistoryData2> history = getHistory02FromSharedPreferences();

    // Ajouter une history02 au stockage
    history.add(item);
    await saveHistory02ToSharedPreferences(history);
  }

  // -------- History02 to dataBase ------------
  Future<void> saveHistory02ToSharedPreferences(
      List<HistoryData2> history) async {
    List<String> historyItem =
        history.map((item) => json.encode(item.toMap())).toList();
    await PreferencesService.instance.setStringList('history_02', historyItem);
  }

  // -------- add a history03 to dataBase ----------
  Future<void> addHistory03(HistoryData3 item) async {
    final List<HistoryData3> history = getHistory03FromSharedPreferences();

    // Ajouter une history03 au stockage
    history.add(item);
    await saveHistory03ToSharedPreferences(history);
  }

  // -------- History03 to dataBase ------------
  Future<void> saveHistory03ToSharedPreferences(
      List<HistoryData3> history) async {
    List<String> historyItem =
        history.map((item) => json.encode(item.toMap())).toList();
    await PreferencesService.instance.setStringList('history_03', historyItem);
  }

  // -------- add a history04 to dataBase ----------
  Future<void> addHistory04(HistoryData4 item) async {
    final List<HistoryData4> history = getHistory04FromSharedPreferences();

    // Ajouter une history04 au stockage
    history.add(item);
    await saveHistory04ToSharedPreferences(history);
  }

  // -------- History04 to dataBase ------------
  Future<void> saveHistory04ToSharedPreferences(
      List<HistoryData4> history) async {
    List<String> historyItem =
    history.map((item) => json.encode(item.toMap())).toList();
    await PreferencesService.instance.setStringList('history_04', historyItem);
  }

  // --------- get all history01 to dataBase ---------
  List<HistoryData1> getHistory01FromSharedPreferences() {
    List<String>? historyJsonList =
        PreferencesService.instance.getStringList('history_01');

    if (historyJsonList == null) return [];

    return historyJsonList.map((historyJson) {
      Map<String, dynamic> historyMap = json.decode(historyJson);
      return HistoryData1.fromMap(historyMap, historyMap['id'] ?? '');
    }).toList();
  }

  // --------- get all history02 to dataBase ---------
  List<HistoryData2> getHistory02FromSharedPreferences() {
    List<String>? historyJsonList =
        PreferencesService.instance.getStringList('history_02');
    if (historyJsonList == null) return [];

    return historyJsonList.map((historyJson) {
      Map<String, dynamic> historyMap = json.decode(historyJson);
      return HistoryData2.fromMap(historyMap, historyMap['id'] ?? '');
    }).toList();
  }

  // --------- get all history03 to dataBase ---------
  List<HistoryData3> getHistory03FromSharedPreferences() {
    List<String>? historyJsonList =
        PreferencesService.instance.getStringList('history_03');
    if (historyJsonList == null) return [];

    return historyJsonList.map((historyJson) {
      Map<String, dynamic> historyMap = json.decode(historyJson);
      return HistoryData3.fromMap(historyMap, historyMap['id'] ?? '');
    }).toList();
  }

  // --------- get all history04 to dataBase ---------
  List<HistoryData4> getHistory04FromSharedPreferences() {
    List<String>? historyJsonList =
    PreferencesService.instance.getStringList('history_04');
    if (historyJsonList == null) return [];

    return historyJsonList.map((historyJson) {
      Map<String, dynamic> historyMap = json.decode(historyJson);
      return HistoryData4.fromMap(historyMap, historyMap['id'] ?? '');
    }).toList();
  }
  //  ------ Fontion to clear sharedPreferences -------------
  Future<void> clearSharedPreferences() async {
    // Utiliser SharedPreferences pour effacer toutes les données
    await PreferencesService.instance.clear();
  }
}
