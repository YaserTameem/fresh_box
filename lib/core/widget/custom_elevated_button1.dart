import 'package:flutter/material.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:get/get.dart';

class CustomElevatedButton1 extends StatelessWidget {
  const CustomElevatedButton1({super.key, required this.text, required this.onPressed, this.color});

  final String text;

  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: Get.isDarkMode ? DarkColors.buttonTextColor : LightColors.buttonTextColor,
        ),
      ),
    );
  }
}
