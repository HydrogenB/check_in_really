import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primary = Color(0xFFE00000);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFCFCFF);
  static const Color surfaceVariant = Color(0xFFF5DDDA);
  static const Color onSurface = Color(0xFF1A1C1E);
  static const Color error = Color(0xFFFF0000);

  // Text Styles
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: onSurface,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: onSurface,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: onSurface,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: onSurface,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: onSurface,
    ),
  );

  // Button Styles
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
  );
}
