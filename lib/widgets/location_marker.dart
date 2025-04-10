import 'package:flutter/material.dart';
import '../design_system/index.dart';

class LocationMarker extends StatelessWidget {
  final bool isInRange;
  final bool isCheckedIn;

  const LocationMarker({
    Key? key,
    required this.isInRange,
    required this.isCheckedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCheckedIn
            ? AppColors.success
            : isInRange
                ? AppColors.primary
                : AppColors.disabled,
      ),
      child: Icon(
        isCheckedIn ? Icons.check : Icons.location_on,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
