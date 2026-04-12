import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title, required this.trailing});

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w300,
          color: Get.isDarkMode ? DarkColors.textBodyColor : LightColors.textBodyColor,
        ),
      ),
      trailing: Text(
        trailing,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w300,
          color: Get.isDarkMode ? DarkColors.textBodyColor : LightColors.textBodyColor,
        ),
      ),
    );
  }
}
