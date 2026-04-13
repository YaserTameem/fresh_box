import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/routing/app_routes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:fresh_box/features/search/search_screen.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon = Icons.search_outlined,
    this.onTap,
    this.showLeading = true,
    this.centerTitle = true,
    this.showActions = true,
  });

  final String title;
  final IconData? icon;
  final Function()? onTap;
  final bool showLeading;
  final bool showActions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w(21)),
      child: AppBar(
        centerTitle: centerTitle,
        leading:
            showLeading
                ? InkWell(
                  onTap: onTap,
                  child: Card(
                    color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                    shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
                    elevation: 2,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )
                : null,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Get.isDarkMode ? DarkColors.textPrimaryColor : LightColors.textPrimaryColor,
          ),
        ),
        actions: [
          showActions
              ? InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.search);
                },
                child: Card(
                  color: Get.isDarkMode ? DarkColors.surfaceColor : LightColors.surfaceColor,
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
                  elevation: 2,
                  child: SizedBox(
                    height: AppSizes.h(48),
                    width: AppSizes.w(48),
                    child: Icon(icon ?? Icons.search_outlined),
                  ),
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

