import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_box/core/bindings/initial_bindings.dart';
import 'package:fresh_box/core/localization/localization_service.dart';
import 'package:fresh_box/core/routing/app_pages.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/services/language_service.dart';
import 'package:fresh_box/core/services/theme_service.dart';
import 'package:fresh_box/core/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  final translations = await LocalizationService.load();
  await Get.putAsync<ThemeService>(() async => ThemeService().init(), permanent: true);
  await Get.putAsync<LanguageService>(() async => LanguageService().init(), permanent: true);
  runApp(MyApp(translations: translations));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.translations});

  final LocalizationService translations;

  @override
  Widget build(BuildContext context) {
    final languageService = Get.find<LanguageService>();
    final themeService = Get.find<ThemeService>();
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (cox, _) {
        return Obx(
          () => GetMaterialApp(
            translations: translations,
            locale: languageService.locale,
            fallbackLocale: LocalizationService.fallbackLocale,
            supportedLocales: LocalizationService.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeService.themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            initialBinding: InitialBindings(),
            getPages: AppPages.routes,
          ),
        );
      },
    );
  }
}
