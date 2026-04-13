import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/app_text_style.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
import 'package:fresh_box/core/theme/light_colors.dart';
import 'package:get/get.dart';

class CustomDiscountBadge extends StatelessWidget {
  const CustomDiscountBadge({super.key, this.discount});

  final int? discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppSizes.w(8)),
      height: AppSizes.h(20),
      width: AppSizes.w(54),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? DarkColors.textHintColor : LightColors.primaryColor,
        borderRadius: AppRadius.xs,
      ),
      child: Row(
        spacing: 3,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/discount_icon.svg'),
          Text("-$discount", style: AppTextStyle.discountStyle),
        ],
      ),
    );
  }
}

