import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  static const TextStyle title = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle button = TextStyle(
    color: AppColors.buttonText,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle successMessage = TextStyle(
    color: AppColors.success,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle errorMessage = TextStyle(
    color: AppColors.error,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
