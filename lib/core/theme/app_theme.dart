import 'package:flutter/material.dart';
import 'package:fresh_box/core/constants/app_radius.dart';
import 'package:fresh_box/core/constants/app_sizes.dart';
import 'package:fresh_box/core/theme/dark_colors.dart';
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
          fontSize: AppSizes.sp(21),
          color: LightColors.textPrimaryColor,
        ),
      ),

      /// Define text styles for different text elements:
      textTheme: base.textTheme.copyWith(
        headlineLarge: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp(21),
          color: LightColors.textTertiaryColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w300,
          fontSize: AppSizes.sp(17),
          color: LightColors.textSecondaryColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp(15),
          color: LightColors.textSecondaryColor,
        ),
        labelMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp(17),
          color: LightColors.textSecondaryColor,
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
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.sp(21),
            color: LightColors.surfaceColor,
          ),
          backgroundColor: LightColors.primaryColor,
          foregroundColor: LightColors.buttonTextColor,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
        ),
      ),
      splashFactory: NoSplash.splashFactory,
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: DarkColors.primaryColor,
        onPrimary: DarkColors.buttonTextColor,
        surface: DarkColors.surfaceColor,
        primaryContainer: DarkColors.cardBackground,
        onSurface: DarkColors.textPrimaryColor,
      ),
      scaffoldBackgroundColor: DarkColors.scaffoldBackground,
      primaryColor: DarkColors.primaryColor,
      cardColor: DarkColors.cardBackground,
      canvasColor: DarkColors.surfaceColor,
      dividerColor: DarkColors.actionDisabledColor,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        foregroundColor: DarkColors.textSecondaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp(21),
          color: DarkColors.textPrimaryColor,
        ),
        iconTheme: const IconThemeData(color: DarkColors.textPrimaryColor),
      ),

      textTheme: base.textTheme.copyWith(
        headlineLarge: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp(21),
          color: DarkColors.textTertiaryColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w300,
          fontSize: AppSizes.sp(17),
          color: DarkColors.textSecondaryColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp(15),
          color: DarkColors.textSecondaryColor,
        ),
        labelMedium: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.sp(17),
          color: DarkColors.textSecondaryColor,
        ),

      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DarkColors.inputBackgroundColor,
        hintStyle: TextStyle(
          fontFamily: _fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: AppSizes.sp(15),
          color: DarkColors.textHintColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: BorderSide(color: DarkColors.primaryColor.withValues(alpha: 0.35)),
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.medium,
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.sp(21),
            color: DarkColors.buttonTextColor,
          ),
          backgroundColor: DarkColors.primaryColor,
          foregroundColor: DarkColors.buttonTextColor,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.small),
        ),
      ),

      iconTheme: const IconThemeData(color: DarkColors.textPrimaryColor),

      splashFactory: NoSplash.splashFactory,
    );
  }
}

