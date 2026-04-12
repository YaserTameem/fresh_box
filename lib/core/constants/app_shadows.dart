import 'package:flutter/material.dart';
import 'package:fresh_box/core/theme/light_colors.dart';

class AppShadows {
  static const supSoftShadow = [
    BoxShadow(
      color: LightColors.transparentShadowColor,
      offset: Offset(0, 32),
      blurRadius: 64,
      spreadRadius: 0,
    ),
  ];
  static const mainSoftShadow = [
    BoxShadow(
      color: LightColors.mainShadowColor,
      offset: Offset(0, 10),
      blurRadius: 34,
      spreadRadius: 0,
    ),
  ];
  static const lightShadow = [
    BoxShadow(
      color: LightColors.mainShadowColor,
      offset: Offset(0, 14),
      blurRadius: 44,
      spreadRadius: 0,
    ),
  ];
}
