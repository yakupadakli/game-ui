import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../core/game_design_tokens.dart';

/// Iridescent soap-bubble plate rendered entirely in code — a translucent
/// radial body, a pastel sweep-gradient rim, and white specular sheens —
/// with [child] centered on top.
class GameSpeechBubble extends StatelessWidget {
  const GameSpeechBubble({
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: GameDesignTokens.spacingLG,
      vertical: GameDesignTokens.spacingMD,
    ),
    this.width,
    this.height,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: const _BubblePainter(),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

/// Paints the soap bubble: translucent body, iridescent rim, sheens.
class _BubblePainter extends CustomPainter {
  const _BubblePainter();

  // Pastel iridescence cycle for the rim (loops back to the first color).
  static const List<Color> _rimColors = [
    Color(0xFFF2BCD2),
    Color(0xFFF6E4B8),
    Color(0xFFC4E8CC),
    Color(0xFFBCDDF4),
    Color(0xFFD6C4F0),
    Color(0xFFF2BCD2),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final s = size.shortestSide;
    final rimWidth = s * 0.05;
    final oval = rect.deflate(rimWidth / 2);

    // Translucent body — nearly clear center, faint blue film toward the edge.
    canvas.drawOval(
      rect.deflate(rimWidth * 0.8),
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFFFFFFFF).withValues(alpha: 0.45),
            const Color(0xFFFFFFFF).withValues(alpha: 0.12),
            const Color(0xFFCFE4F2).withValues(alpha: 0.30),
            const Color(0xFFFFFFFF).withValues(alpha: 0.55),
          ],
          stops: const [0.0, 0.5, 0.85, 1.0],
        ).createShader(rect),
    );

    // Iridescent rim.
    canvas.drawOval(
      oval,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rimWidth
        ..shader = SweepGradient(
          colors: _rimColors,
          transform: const GradientRotation(-math.pi / 3),
        ).createShader(rect),
    );

    // Soft inner white ring just inside the rim.
    canvas.drawOval(
      rect.deflate(rimWidth * 1.6),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rimWidth * 0.6
        ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.35),
    );

    // Specular sheens: large top-left blob, small companion dot, and a faint
    // catch-light at the bottom-right.
    _sheen(
      canvas,
      center: Offset(size.width * 0.28, size.height * 0.20),
      radius: Offset(s * 0.16, s * 0.075),
      angle: -0.6,
      alpha: 0.9,
    );
    _sheen(
      canvas,
      center: Offset(size.width * 0.16, size.height * 0.36),
      radius: Offset(s * 0.045, s * 0.035),
      angle: -0.6,
      alpha: 0.8,
    );
    _sheen(
      canvas,
      center: Offset(size.width * 0.76, size.height * 0.80),
      radius: Offset(s * 0.09, s * 0.045),
      angle: -0.5,
      alpha: 0.5,
    );
  }

  void _sheen(
    Canvas canvas, {
    required Offset center,
    required Offset radius,
    required double angle,
    required double alpha,
  }) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset.zero,
        width: radius.dx * 2,
        height: radius.dy * 2,
      ),
      Paint()..color = const Color(0xFFFFFFFF).withValues(alpha: alpha),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _BubblePainter oldDelegate) => false;
}
