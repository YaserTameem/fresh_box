import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/light_colors.dart';

class AppTextStyle {
  static TextStyle discountStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: AppSizes.sp12,
    fontWeight: FontWeight.w500,
    color: LightColors.surfaceColor,
  );
  static TextStyle discountTimeStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: AppSizes.sp15,
    fontWeight: FontWeight.w500,
    color: LightColors.textSupColor,
  );
  static TextStyle ratingStyle = TextStyle(
    fontFamily: 'Montserrat',
    color: Color(0xFF5BC439),
    fontWeight: FontWeight.w500,
    fontSize: AppSizes.sp15,
  );
  static TextStyle buttonStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    fontSize: AppSizes.sp15,
  );
  static TextStyle discStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w300,
    fontSize: AppSizes.sp13,
    color: LightColors.textSecondaryColor,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle subtitle = TextStyle(
    fontSize: AppSizes.sp15,
    fontWeight: FontWeight.w300,
    color: LightColors.textBodyColor,
  );

  static TextStyle body = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    fontSize: AppSizes.sp17,
    color: LightColors.textPrimaryColor,
  );

  //
  // static const TextStyle caption = TextStyle(
  //   fontSize: 12,
  //   color: Colors.grey,
  // );
}
