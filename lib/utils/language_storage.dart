import 'package:shared_preferences/shared_preferences.dart';

class LanguageStorage {
  static const String _key = 'language_code';

  static Future<void> saveLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, langCode);
  }

  static Future<String> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? 'en';
  }
}