import 'package:flutter/material.dart';
import 'package:cut2style/core/constants/colors.dart'; // Adjust path as needed

class AppTextStyle {
  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.textLight,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonText,
  );

  static const TextStyle input = TextStyle(
    fontSize: 16,
    color: AppColors.inputText,
  );

  static const TextStyle link = TextStyle(
    fontSize: 15,
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
}
