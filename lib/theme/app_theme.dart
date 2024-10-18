import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.secondary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: _textTheme(),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.buttonBackground,  // Button background color
        textTheme: ButtonTextTheme.primary,  // Text color for buttons
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        surface: AppColors.surface,
        onPrimary: AppColors.onPrimary ?? Colors.white, // Use default value
        onSecondary: AppColors.onSecondary ?? Colors.white, // Use default value
        onError: AppColors.onError ?? Colors.white, // Use default value
        onSurface: AppColors.onSurface ?? Colors.black, // Use default value
      ),
    );
  }

  static TextTheme _textTheme() {
    return TextTheme(
      headlineLarge: TextStyle(color: AppColors.textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: AppColors.textPrimary, fontSize: 28, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 16),
      labelLarge: TextStyle(color: AppColors.buttonText, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
