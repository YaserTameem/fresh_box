import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/light_colors.dart';

class AppTheme {
  static const String _fontFamily = 'Montserrat';

  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.light,
        primary: LightColors.primaryColor,
        onPrimary: LightColors.buttonTextColor,
        surface: LightColors.surfaceColor,
        primaryContainer: LightColors.surfaceColor,
      ),

      scaffoldBackgroundColor: LightColors.scaffoldBackground,
      primaryColor: LightColors.primaryColor,

      /// Define AppBar theme:
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        foregroundColor: LightColors.textSecondaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp21,
          color: LightColors.textPrimaryColor,
        ),
      ),

      /// Define text styles for different text elements:
      textTheme: base.textTheme.copyWith(
        headlineLarge: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp21,
          color: LightColors.textTertiaryColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w300,
          fontSize: AppSizes.sp17,
          color: LightColors.textSecondaryColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp15,
          color: LightColors.textSecondaryColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp21,
          color: LightColors.textPrimaryColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp21,
          color: LightColors.buttonTextColor,
        ),
        bodySmall: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w300,
          fontSize: AppSizes.sp15,
          color: LightColors.textSecondaryColor,
        ),
        titleMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp17,
          color: LightColors.textTertiaryColor,
        ),
        labelMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp17,
          color: LightColors.textSecondaryColor,
        ),
        displayMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp17,
          color: LightColors.primaryColor,
        ),
        displaySmall: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w300,
          fontSize: AppSizes.sp15,
          color: LightColors.textTertiaryColor,
        ),
      ),

      /// Define input field styles:
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),

      /// Define button styles:
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: LightColors.primaryColor,
          foregroundColor: LightColors.buttonTextColor,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
        ),
      ),
      splashFactory: NoSplash.splashFactory,
    );
  }
}
