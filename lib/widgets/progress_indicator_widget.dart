import 'package:flutter/material.dart';
import '../config/theme.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int total;
  final int completed;

  const ProgressIndicatorWidget({
    Key? key,
    required this.total,
    required this.completed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            total,
            (index) => Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index < completed ? AppTheme.primary : Colors.grey[200],
              ),
              child: index < completed
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '$completed/$total',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
