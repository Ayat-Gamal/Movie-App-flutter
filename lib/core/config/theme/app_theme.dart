import 'package:flutter/material.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.secondBackground,
    brightness: Brightness.light,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.primaryTwo,
      contentTextStyle: TextStyle(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.primaryTwo,
      hintStyle: const TextStyle(
        color: AppColors.secondBackground,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
    primaryTextTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.primary),
    ),
  );
}
