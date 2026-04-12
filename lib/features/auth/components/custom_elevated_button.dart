import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    this.isFacebook = false,
  });

  final String label;
  final String icon;
  final Color backgroundColor;
  final bool isFacebook;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      onPressed: () {},
      icon: SvgPicture.asset(icon),
      label: Text(
        label,
        style:
            isFacebook
                ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
                  fontWeight: FontWeight.w300,
                )
                : Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Get.isDarkMode ? DarkColors.textTertiaryColor : LightColors.textTertiaryColor,
                  fontWeight: FontWeight.w300,
                ),
      ),
    );
  }
}
