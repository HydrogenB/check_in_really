import 'package:flutter/material.dart';
import 'dart:math';
import 'colors.dart';

class SuccessCheckAnimation extends StatefulWidget {
  final double size;

  const SuccessCheckAnimation({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<SuccessCheckAnimation> createState() => _SuccessCheckAnimationState();
}

class _SuccessCheckAnimationState extends State<SuccessCheckAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _checkAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.5, 1, curve: Curves.easeOut)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: SuccessCheckPainter(
            progress: _checkAnimation.value,
            scale: _scaleAnimation.value,
          ),
        );
      },
    );
  }
}

class SuccessCheckPainter extends CustomPainter {
  final double progress;
  final double scale;

  SuccessCheckPainter({required this.progress, required this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 15
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.45, size.height * 0.7);
    path.lineTo(size.width * 0.8, size.height * 0.3);

    final pathMetric = path.computeMetrics().first;
    final drawPath = pathMetric.extractPath(0, pathMetric.length * progress);

    canvas.scale(scale);
    canvas.drawPath(drawPath, paint);
  }

  @override
  bool shouldRepaint(SuccessCheckPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.scale != scale;
  }
}

class ConfettiAnimation extends StatefulWidget {
  final AnimationController controller;

  const ConfettiAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ConfettiAnimation> createState() => _ConfettiAnimationState();
}

class _ConfettiAnimationState extends State<ConfettiAnimation> {
  final List<_ConfettiPiece> _pieces = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _generatePieces();
    widget.controller.addListener(_updatePieces);
  }

  void _generatePieces() {
    for (int i = 0; i < 50; i++) {
      _pieces.add(_ConfettiPiece(
        color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
        position: Offset(_random.nextDouble(), 0),
        velocity: Offset(
          _random.nextDouble() * 2 - 1,
          _random.nextDouble() * 3 + 1,
        ),
      ));
    }
  }

  void _updatePieces() {
    setState(() {
      for (var piece in _pieces) {
        piece.update(widget.controller.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _ConfettiPainter(_pieces, widget.controller.value),
    );
  }
}

class _ConfettiPiece {
  Offset position;
  final Offset velocity;
  final Color color;

  _ConfettiPiece({
    required this.position,
    required this.velocity,
    required this.color,
  });

  void update(double progress) {
    position += velocity * progress;
  }
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiPiece> pieces;
  final double progress;

  _ConfettiPainter(this.pieces, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    for (var piece in pieces) {
      canvas.drawCircle(
        Offset(
          piece.position.dx * size.width,
          piece.position.dy * size.height,
        ),
        4,
        Paint()..color = piece.color,
      );
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) => true;
}

class LocationPulseAnimation extends StatefulWidget {
  const LocationPulseAnimation({Key? key}) : super(key: key);

  @override
  State<LocationPulseAnimation> createState() => _LocationPulseAnimationState();
}

class _LocationPulseAnimationState extends State<LocationPulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PulsePainter(
        progress: _animation.value,
        color: AppColors.primary,
      ),
      child: const SizedBox(width: 50, height: 50),
    );
  }
}

class PulsePainter extends CustomPainter {
  final double progress;
  final Color color;

  PulsePainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    for (var i = 0; i < 3; i++) {
      final adjustedProgress = (progress - (i * 0.2)).clamp(0.0, 1.0);
      final radius = maxRadius * adjustedProgress;
      final opacity = (1 - adjustedProgress).clamp(0.0, 1.0);

      final paint = Paint()
        ..color = color.withOpacity(opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(PulsePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

class PulsingButton extends StatefulWidget {
  final Widget child;

  const PulsingButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<PulsingButton> createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<PulsingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: widget.child,
        );
      },
    );
  }
}
