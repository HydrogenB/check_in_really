import 'package:flutter/material.dart';
import 'colors.dart';
import 'spacing.dart';

class AppButtons {
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.buttonPadding,
      vertical: AppSpacing.sm,
    ),
  );

  static final ButtonStyle secondaryButton = OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    side: const BorderSide(color: AppColors.primary, width: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.buttonPadding,
      vertical: AppSpacing.sm,
    ),
  );

  static final ButtonStyle iconButton = IconButton.styleFrom(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.all(AppSpacing.sm),
  );
}
