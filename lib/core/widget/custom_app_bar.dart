import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_shadows.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/light_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
      leadingWidth: AppSizes.w100,
      leading: Container(
        margin: EdgeInsets.only(left: AppSizes.pw24, right: AppSizes.pw28, bottom: AppSizes.ph3),
        decoration: BoxDecoration(
          color: LightColors.surfaceColor,
          borderRadius: AppRadius.medium,
          boxShadow: AppShadows.lightShadow,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      title: Text(title),
      actions: [
        Container(
          height: AppSizes.h48,
          width: AppSizes.w48,
          decoration: BoxDecoration(
            color: LightColors.surfaceColor,
            borderRadius: AppRadius.medium,
            boxShadow: AppShadows.lightShadow,
          ),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
