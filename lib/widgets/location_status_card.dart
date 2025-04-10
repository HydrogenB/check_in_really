import 'package:flutter/material.dart';
import '../design_system/index.dart';

class LocationStatusCard extends StatelessWidget {
  final String name;
  final double distance;
  final bool isCheckedIn;
  final String? achievementTitle;
  final bool isInRange;
  final VoidCallback? onTap;

  const LocationStatusCard({
    Key? key,
    required this.name,
    required this.distance,
    this.isCheckedIn = false,
    this.achievementTitle,
    this.isInRange = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          border: Border.all(
            color: isInRange
                ? AppColors.success.withOpacity(0.3)
                : AppColors.divider,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          color: isInRange
              ? AppColors.success.withOpacity(0.05)
              : AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: isInRange
                  ? AppColors.success.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: InkWell(
          onTap: isInRange ? onTap : null,
          borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isInRange ? AppColors.success : AppColors.disabled,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isInRange) const LocationPulseAnimation(),
                    Icon(
                      isInRange ? Icons.check_circle : Icons.location_on,
                      color: AppColors.onPrimary,
                      size: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTypography.body1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        Icon(
                          isInRange ? Icons.touch_app : Icons.directions_walk,
                          size: 16,
                          color: isInRange
                              ? AppColors.success
                              : AppColors.disabled,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Text(
                          isInRange
                              ? "You're here! Tap to check in"
                              : '${distance.toInt()}m away',
                          style: AppTypography.body2.copyWith(
                            color: isInRange
                                ? AppColors.success
                                : AppColors.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    if (isCheckedIn && achievementTitle != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        achievementTitle!,
                        style: AppTypography.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isInRange)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.success.withOpacity(0.5),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
