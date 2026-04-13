import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  LocalizationService(this._keys);

  final Map<String, Map<String, String>> _keys;
  static const Locale englishLocale = Locale('en');
  static const Locale arabicLocale = Locale('ar');
  static const Locale fallbackLocale = englishLocale;

  static const List<Locale> supportedLocales = [englishLocale, arabicLocale];

  static Future<LocalizationService> load() async {
    final en = await _loadJson('assets/translations/en.json');
    final ar = await _loadJson('assets/translations/ar.json');

    return LocalizationService({'en': en, 'ar': ar});
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final raw = await rootBundle.loadString(path);
    final Map<String, dynamic> decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map((key, value) => MapEntry(key, value.toString()));
  }

  static Locale localeFromDevice(Locale? deviceLocale) {
    if (deviceLocale == null) return fallbackLocale;
    final languageCode = deviceLocale.languageCode.toLowerCase();
    return supportedLocales.firstWhere(
      (locale) => locale.languageCode.toLowerCase() == languageCode,
      orElse: () => fallbackLocale,
    );
  }

  @override
  Map<String, Map<String, String>> get keys => _keys;
}
