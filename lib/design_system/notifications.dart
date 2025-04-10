import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class ToastNotification extends StatelessWidget {
  final String title;
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const ToastNotification({
    Key? key,
    required this.title,
    required this.message,
    this.backgroundColor = const Color(0xFFE00000),
    this.textColor = Colors.white,
    this.icon = Icons.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: textColor.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
