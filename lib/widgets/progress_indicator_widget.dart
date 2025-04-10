import 'package:flutter/material.dart';
import '../design_system/index.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int total;
  final int completed;

  const ProgressIndicatorWidget({
    Key? key,
    required this.total,
    required this.completed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Your Progress',
          style: AppTypography.headline3.copyWith(
            color: AppColors.onPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              total,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < completed
                        ? AppColors.onPrimary
                        : AppColors.onPrimary.withOpacity(0.2),
                    border: Border.all(
                      color: AppColors.onPrimary.withOpacity(0.5),
                      width: 2,
                    ),
                    boxShadow: index < completed
                        ? [
                            BoxShadow(
                              color: AppColors.onPrimary.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: index < completed
                        ? const Icon(
                            Icons.check_circle,
                            color: AppColors.primary,
                            size: 24,
                          )
                        : Center(
                            child: Text(
                              '${index + 1}',
                              style: AppTypography.body1.copyWith(
                                color: AppColors.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.onPrimary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          ),
          child: Text(
            '$completed of $total completed',
            style: AppTypography.body1.copyWith(
              color: AppColors.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
