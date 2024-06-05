import 'dart:convert';

import 'package:blecor/models/class_manager/history_1.dart';
import 'package:blecor/models/class_manager/user.dart';
import 'package:blecor/models/preferences_manager/shared.dart';

import '../class_manager/history_3.dart';

class MyPreferences {
  static const _keyFirst = 'code';

  static Future setCode(String code) async {
    await PreferencesService.instance.setString(_keyFirst, code);
  }

  static String getCode() {
    final code = PreferencesService.instance.getString(_keyFirst) ?? '';
    return code;
  }

  static Future updateCode(String code) async {
    // update a first enter to application
    setCode(code);
  }
}
