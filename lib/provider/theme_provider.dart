import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  ThemeMode get themeMode {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}