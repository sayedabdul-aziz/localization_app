import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  Future<String> getCachedLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    final cachedLanguage = preferences.getString('LOCALE');
    if (cachedLanguage != null) {
      return cachedLanguage;
    } else {
      return 'en';
    }
  }

  Future<void> changeCachedLanguage(String languageCode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('LOCALE', languageCode);
  }
}
