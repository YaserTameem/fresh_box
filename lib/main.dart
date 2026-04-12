import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_box/core/routing/app_pages.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/services/theme_service.dart';
import 'package:fresh_box/core/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  await Get.putAsync<ThemeService>(() async => ThemeService().init(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (cox, _) {
        return Obx(
          () => GetMaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeService.themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.main,
            getPages: AppPages.routes,
          ),
        );
      },
    );
  }
}
