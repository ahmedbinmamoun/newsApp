import 'package:flutter/material.dart';
import 'package:news/utils/theme_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    ThemeStorage.saveTheme(newTheme);
    notifyListeners();
  }

  Future<void> loadTheme() async {
    appTheme = await ThemeStorage.loadTheme();
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
  void toggleTheme(bool dark) async {
    appTheme = dark ? ThemeMode.dark : ThemeMode.light;
    ThemeStorage.saveTheme(appTheme);
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', dark);
  }
}
