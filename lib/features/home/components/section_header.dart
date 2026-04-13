import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/cart/cart_screen.dart';
import 'package:get/get.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Get.isDarkMode ? DarkColors.textPrimaryColor : LightColors.textPrimaryColor,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: AppRadius.xs),
              backgroundColor:
                  Get.isDarkMode ? DarkColors.textSecondaryColor : LightColors.textSecondaryColor,
              fixedSize: Size(AppSizes.w(78), AppSizes.h(26)),
            ),
            onPressed: onPressed,
            child: Text(
              'See All',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

