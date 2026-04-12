import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxService {
  static const _themeKey = 'app_theme_mode';
  final GetStorage _storage = GetStorage();
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  ThemeMode get themeMode => _themeMode.value;

  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  Future<ThemeService> init() async {
    final savedTheme = _storage.read<String>(_themeKey);

    _themeMode.value = _mapStringToThemeMode(savedTheme);
    return this;
  }

  Future<void> setTheme(ThemeMode mode) async {
    _themeMode.value = mode;
    await _storage.write(_themeKey, mode.name);
  }

  Future<void> toggleTheme() async {
    final nextTheme = _themeMode.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await setTheme(nextTheme);
  }

  ThemeMode _mapStringToThemeMode(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}
