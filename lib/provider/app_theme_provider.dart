import 'package:flutter/material.dart';
import 'package:news/utils/theme_storage.dart';

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
}
