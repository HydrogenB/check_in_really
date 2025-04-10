import 'package:flutter/material.dart';
import 'colors.dart';
import 'dart:math';

class RadarWidget extends StatefulWidget {
  final double size;

  const RadarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<RadarWidget> createState() => _RadarWidgetState();
}

class _RadarWidgetState extends State<RadarWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: RadarBackgroundPainter(),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: RadarSweepPainter(
                angle: _controller.value * 2 * pi,
                color: AppColors.primary,
              ),
            );
          },
        ),
      ),
    );
  }
}

class RadarBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final backgroundPaint = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.fill;

    final circlePaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Draw background
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw concentric circles
    for (var i = 1; i <= 3; i++) {
      canvas.drawCircle(center, radius * i / 3, circlePaint);
    }

    // Draw cross lines
    canvas.drawLine(
      Offset(center.dx - radius, center.dy),
      Offset(center.dx + radius, center.dy),
      circlePaint,
    );
    canvas.drawLine(
      Offset(center.dx, center.dy - radius),
      Offset(center.dx, center.dy + radius),
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(RadarBackgroundPainter oldDelegate) => false;
}

class RadarSweepPainter extends CustomPainter {
  final double angle;
  final Color color;

  RadarSweepPainter({
    required this.angle,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final paint = Paint()
      ..shader = SweepGradient(
        colors: [color.withOpacity(0), color.withOpacity(0.5)],
        stops: const [0.0, 1.0],
        startAngle: 0.0,
        endAngle: pi / 2,
        transform: GradientRotation(angle),
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(RadarSweepPainter oldDelegate) {
    return oldDelegate.angle != angle || oldDelegate.color != color;
  }
}
