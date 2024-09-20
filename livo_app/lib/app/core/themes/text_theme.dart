import 'package:flutter/material.dart';
import 'package:livo_app/app/core/themes/app_colors.dart';

ThemeData appTextTheme = ThemeData(
  fontFamily: 'ShantellSans',
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: AppColors.darkTextColor,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    labelMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.lightTextColor),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.darkTextColor),
  ),
);
