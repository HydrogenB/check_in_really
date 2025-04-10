import 'package:flutter/material.dart';
import '../config/theme.dart';

class LocationStatusCard extends StatelessWidget {
  final String name;
  final double distance;
  final bool isCheckedIn;
  final String? achievementTitle;

  const LocationStatusCard({
    Key? key,
    required this.name,
    required this.distance,
    this.isCheckedIn = false,
    this.achievementTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isInRange = distance <= 50;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isInRange ? Colors.green[200]! : Colors.grey[200]!,
        ),
        borderRadius: BorderRadius.circular(12),
        color: isInRange ? Colors.green[50] : Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isInRange ? Colors.green : Colors.grey[200],
            ),
            child: Icon(
              isInRange ? Icons.check_circle : Icons.location_on,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  isInRange
                      ? "You're here! Tap to check in"
                      : '${distance.toInt()}m away',
                  style: TextStyle(
                    color: isInRange ? Colors.green : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
