import 'package:flutter/material.dart';
import '../design_system/index.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Help & Support', style: AppTypography.headline3),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHelpItem(
            'Location Access',
            'App needs location permission to validate check-ins',
            Icons.location_on,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildHelpItem(
            'Check-in Range',
            'Must be within 50 meters of location to check in',
            Icons.radio_button_checked,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildHelpItem(
            'Achievements',
            'Unlock unique achievements at each location',
            Icons.emoji_events,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildHelpItem(String title, String description, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: AppTypography.body1
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(description, style: AppTypography.body2),
            ],
          ),
        ),
      ],
    );
  }
}
