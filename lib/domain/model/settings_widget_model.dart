import 'package:flutter/cupertino.dart';

class SettingsWidgetModel extends ChangeNotifier {
  bool _isDarkTheme = true;
  bool get isDarkTheme => _isDarkTheme;
  set isDarkTheme(bool val) {
    _isDarkTheme = val;
    notifyListeners();
  }
}
