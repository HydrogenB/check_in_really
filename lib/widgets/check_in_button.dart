import 'package:flutter/material.dart';
import '../config/theme.dart';

class CheckInButton extends StatelessWidget {
  final bool enabled;
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;

  const CheckInButton({
    Key? key,
    this.enabled = true,
    this.isLoading = false,
    this.onPressed,
    this.text = 'Check In Now',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: enabled ? AppTheme.primary : Colors.grey[300],
      ),
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            else
              const Icon(Icons.location_on, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
