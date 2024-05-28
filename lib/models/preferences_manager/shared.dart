
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesService {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> init() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  static SharedPreferences get instance {
    if (_preferences == null) {
      throw Exception("PreferencesService not initialized");
    }
    return _preferences!;
  }
}
