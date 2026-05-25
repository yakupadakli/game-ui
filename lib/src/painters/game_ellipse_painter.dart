import 'package:flutter/widgets.dart';

/// Fills the canvas bounds with a solid-color oval.
class GameEllipsePainter extends CustomPainter {
  const GameEllipsePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawOval(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant GameEllipsePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
