import 'package:flutter/material.dart';
import '../theme.dart';

enum NotificationType { success, error, info }

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final NotificationType type;
  final VoidCallback? onAction;
  final String? actionLabel;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    this.type = NotificationType.info,
    this.onAction,
    this.actionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        border: Border.all(color: _getBorderColor()),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(_getIcon(), color: _getIconColor()),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  message,
                  style: const TextStyle(fontSize: 14),
                ),
                if (onAction != null && actionLabel != null) ...[
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: onAction,
                    child: Text(actionLabel!),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case NotificationType.success:
        return AppTheme.surfaceVariant;
      case NotificationType.error:
        return Colors.red.shade50;
      case NotificationType.info:
        return Colors.blue.shade50;
    }
  }

  Color _getBorderColor() {
    switch (type) {
      case NotificationType.success:
        return AppTheme.primary;
      case NotificationType.error:
        return AppTheme.error;
      case NotificationType.info:
        return Colors.blue;
    }
  }

  IconData _getIcon() {
    switch (type) {
      case NotificationType.success:
        return Icons.check_circle;
      case NotificationType.error:
        return Icons.error_outline;
      case NotificationType.info:
        return Icons.info_outline;
    }
  }

  Color _getIconColor() {
    switch (type) {
      case NotificationType.success:
        return AppTheme.primary;
      case NotificationType.error:
        return AppTheme.error;
      case NotificationType.info:
        return Colors.blue;
    }
  }
}
