import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:get/get.dart';

class AppTextStyle {
  static TextStyle discountStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: AppSizes.sp(12),
    fontWeight: FontWeight.w500,
    color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
  );

  static TextStyle discStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w300,
    fontSize: AppSizes.sp(13),
    color: Get.isDarkMode ? DarkColors.textSecondaryColor : LightColors.textSecondaryColor,
    overflow: TextOverflow.ellipsis,
  );
}

