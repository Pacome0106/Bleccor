import 'package:flutter/cupertino.dart';

class ProviderManager extends ChangeNotifier{

  bool _isPicture = false;
  String _messagePicture = '';
  bool _isPaused = true;


  bool get isPicture => _isPicture;
  String get messagePicture => _messagePicture;

  bool get isPaused => _isPaused;


  set isPicture(bool value) {
    _isPicture = value;
    notifyListeners();
  }
  set messagePicture(String value) {
    _messagePicture = value;
    notifyListeners();
  }


  set isPaused(bool value) {
    _isPaused = value;
    notifyListeners();
  }
}
