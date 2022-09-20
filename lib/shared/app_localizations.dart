import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;
  AppLocalizations({required this.locale});

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizaionsDelegate();

  late Map<String, String> _localizationStrings;
  Future loadJsonLanguage() async {
    String jsonLan = await rootBundle
        .loadString("assets/language/${locale!.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonLan);

    _localizationStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizationStrings[key] ?? "";
}

class _AppLocalizaionsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizaionsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension TranslateX on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
