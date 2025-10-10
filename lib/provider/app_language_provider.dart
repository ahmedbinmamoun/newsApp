import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/utils/language_storage.dart';

class AppLanguageProvider with ChangeNotifier {
  String _appLanguage = 'en';

  String get appLanguage => _appLanguage;

  Locale get locale => Locale(_appLanguage);

  Future<void> loadLocale() async {
    _appLanguage = await LanguageStorage.loadLanguage();
    notifyListeners();
  }

  void changeLanguage(String langCode, BuildContext context) {
    if (_appLanguage == langCode) return;

    _appLanguage = langCode;
    LanguageStorage.saveLanguage(langCode);
    context.setLocale(Locale(_appLanguage));
    notifyListeners();
  }

  bool isEnglish() => _appLanguage == 'en';
}