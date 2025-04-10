import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';
import 'buttons.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          displayLarge: AppTypography.headline1,
          displayMedium: AppTypography.headline2,
          displaySmall: AppTypography.headline3,
          bodyLarge: AppTypography.body1,
          bodyMedium: AppTypography.body2,
          bodySmall: AppTypography.caption,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppButtons.primaryButton,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: AppButtons.secondaryButton,
        ),
      );
}
