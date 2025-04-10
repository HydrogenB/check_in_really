import 'package:flutter/material.dart';
import '../theme.dart';

class CheckInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool enabled;
  final String label;

  const CheckInButton({
    Key? key,
    this.onPressed,
    this.isLoading = false,
    this.enabled = true,
    this.label = 'Check In Now',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: enabled ? onPressed : null,
        style: AppTheme.primaryButtonStyle,
        icon: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Icon(Icons.location_on),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
