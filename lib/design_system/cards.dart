import 'package:flutter/material.dart';
import 'colors.dart';
import 'spacing.dart';
import 'typography.dart';

class AchievementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isCompleted;

  const AchievementCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCompleted ? AppColors.surfaceVariant : AppColors.surface,
        border: Border.all(
          color: isCompleted ? AppColors.primary : Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCompleted ? AppColors.primary : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: isCompleted
                ? const Icon(Icons.check, color: AppColors.onPrimary)
                : null,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    AppTypography.body1.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: AppTypography.body2.copyWith(
                  color: isCompleted ? AppColors.primary : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Add other card components like LocationStatusCard, CelebrationCard etc.
