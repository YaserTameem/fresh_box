import 'dart:ui';

import 'package:fresh_box/core/localization/localization_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService extends GetxService {
  static const String _languageKey = 'app_language';
  final GetStorage _storage = GetStorage();
  late Locale _locale;

  Locale get locale => _locale;

  bool get isArabic => _locale.languageCode == 'ar';

  Future<LanguageService> init() async {
    _locale = _getSavedOrDeviceLocale();
    return this;
  }

  Locale _getSavedOrDeviceLocale() {
    final savedLanguageCode = _storage.read<String>(_languageKey);
    if (savedLanguageCode != null && savedLanguageCode.isNotEmpty) {
      return Locale(savedLanguageCode);
    }
    return LocalizationService.localeFromDevice(PlatformDispatcher.instance.locale);
  }

  Future<void> changeLanguage(Locale newLocale) async {
    if (_locale.languageCode == newLocale.languageCode) {
      return;
    }
    _locale = newLocale;
    await _storage.write(_languageKey, newLocale.languageCode);
    await Get.updateLocale(newLocale);
  }
}
