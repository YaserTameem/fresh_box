import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/auth/login_screen.dart';
import 'package:fresh_box/features/onboarding/onboarding_screen.dart';
import 'package:fresh_box/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
      body: Center(child: SvgPicture.asset('assets/images/splash_logo.svg')),
    );
  }
}
