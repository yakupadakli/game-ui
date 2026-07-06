import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Color variants for [GameFrame]. Each seeds a full wavy-slab palette
/// (rim, inner highlight, pooled bottom) derived in code.
enum GameFrameVariant {
  blue(face: Color(0xFF5FA9DD)),
  green(face: Color(0xFF7CBF3F)),
  orange(face: Color(0xFFF59B23)),
  purple(face: Color(0xFFA66FD1)),
  yellow(face: Color(0xFFF9C440));

  const GameFrameVariant({required this.face});

  /// Slab face color; the rim and shading derive from it.
  final Color face;
}

/// Rounded wavy "jelly slab" frame container, rendered entirely in code —
/// a squircle with gently pinched sides, a dark rim, a light inner rim, a
/// top-left gloss streak, and a pooled darker band along the bottom.
///
/// Pass [onTap] to make the frame interactive (wraps in [GameTapScale]).
class GameFrame extends StatelessWidget {
  const GameFrame({
    required this.child,
    this.variant = GameFrameVariant.blue,
    this.padding = const EdgeInsets.all(GameDesignTokens.spacingLG),
    this.width,
    this.height,
    this.onTap,
    super.key,
  });

  final Widget child;
  final GameFrameVariant variant;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final frame = SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _FramePainter(variant.face),
        child: Padding(padding: padding, child: child),
      ),
    );

    if (onTap == null) return frame;
    return GameTapScale(onTap: onTap, child: frame);
  }
}

/// Paints the wavy slab: face, rim, inner rim, gloss streak, bottom pool.
class _FramePainter extends CustomPainter {
  _FramePainter(this.face)
    : rim = GameColors.deepen(face, 0.28, 0.15),
      innerRim = GameColors.lighten(face, 0.32),
      pool = GameColors.darken(face, 0.08);

  final Color face;
  final Color rim;
  final Color innerRim;
  final Color pool;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final rimWidth = s * 0.045;
    final shape = _slabPath(size, inset: rimWidth / 2);

    // Face.
    canvas.drawPath(shape, Paint()..color = face);

    // Pooled darker band along the bottom (clipped to the slab).
    canvas.save();
    canvas.clipPath(shape);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.74, size.width, size.height * 0.26),
      Paint()..color = pool.withValues(alpha: 0.55),
    );
    canvas.restore();

    // Light inner rim just inside the dark outer rim.
    canvas.drawPath(
      _slabPath(size, inset: rimWidth * 1.6),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rimWidth * 0.55
        ..color = innerRim,
    );

    // Dark outer rim.
    canvas.drawPath(
      shape,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rimWidth
        ..color = rim
        ..strokeJoin = StrokeJoin.round,
    );

    // Top-left gloss streak riding the inner shoulder.
    final gloss = Path()
      ..moveTo(size.width * 0.13, size.height * 0.20)
      ..quadraticBezierTo(
        size.width * 0.15,
        size.height * 0.12,
        size.width * 0.24,
        size.height * 0.10,
      );
    canvas.drawPath(
      gloss,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = s * 0.035
        ..strokeCap = StrokeCap.round
        ..color = GameColors.lighten(face, 0.38),
    );
  }

  /// The wavy slab silhouette: rounded corners with gently concave edges.
  Path _slabPath(Size size, {required double inset}) {
    final w = size.width;
    final h = size.height;
    final l = inset;
    final t = inset;
    final r = w - inset;
    final b = h - inset;
    final cr = size.shortestSide * 0.20; // corner radius
    final waveX = w * 0.045; // horizontal pinch depth
    final waveY = h * 0.045; // vertical pinch depth

    return Path()
      ..moveTo(l + cr, t)
      // Top edge: bows slightly downward mid-edge.
      ..cubicTo(w * 0.35, t + waveY, w * 0.65, t + waveY, r - cr, t)
      ..quadraticBezierTo(r, t, r, t + cr)
      // Right edge: bows slightly inward.
      ..cubicTo(r - waveX, h * 0.35, r - waveX, h * 0.65, r, b - cr)
      ..quadraticBezierTo(r, b, r - cr, b)
      // Bottom edge.
      ..cubicTo(w * 0.65, b - waveY, w * 0.35, b - waveY, l + cr, b)
      ..quadraticBezierTo(l, b, l, b - cr)
      // Left edge.
      ..cubicTo(l + waveX, h * 0.65, l + waveX, h * 0.35, l, t + cr)
      ..quadraticBezierTo(l, t, l + cr, t)
      ..close();
  }

  @override
  bool shouldRepaint(covariant _FramePainter oldDelegate) =>
      oldDelegate.face != face;
}
