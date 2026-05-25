import 'package:flutter/widgets.dart';

/// Paints a single curved highlight stroke from the lower-left to the
/// upper-right, suggesting a glossy edge.
///
/// Sized by its parent — width/height ratio shapes the arc.
class GameGlossPainter extends CustomPainter {
  const GameGlossPainter({
    this.color = const Color(0xFFFFFFFF),
    this.strokeWidth = 4.0,
  });

  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(3, size.height - 1)
      ..quadraticBezierTo(0, 0, size.width - 4, size.height * 0.2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant GameGlossPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}
