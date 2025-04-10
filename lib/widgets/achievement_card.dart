import 'package:flutter/material.dart';
import '../design_system/index.dart';

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
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCompleted ? AppColors.success : AppColors.disabled,
          child: Icon(
            isCompleted ? Icons.emoji_events : Icons.lock,
            color: AppColors.onPrimary,
          ),
        ),
        title: Text(title, style: AppTypography.body1),
        subtitle: Text(subtitle, style: AppTypography.body2),
      ),
    );
  }
}
