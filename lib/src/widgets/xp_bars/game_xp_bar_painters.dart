part of 'game_xp_bar.dart';

/// Paints one layer of a [GameXpBar]: the empty track when [fill] is false,
/// or the fill elements when [fill] is true (the widget reveal-clips the fill
/// layer to the progress fraction).
class _XpBarPainter extends CustomPainter {
  const _XpBarPainter({required this.style, required this.fill});

  final GameXpBarStyle style;
  final bool fill;

  @override
  void paint(Canvas canvas, Size size) {
    switch (style) {
      case GameXpBarStyle.blue:
        _paintTube(
          canvas,
          size,
          const Color(0xFF4A8FD4),
          const Color(0xFF2E9BF0),
        );
      case GameXpBarStyle.purple:
        _paintTube(
          canvas,
          size,
          const Color(0xFF6E3A8C),
          const Color(0xFFCB66F0),
        );
      case GameXpBarStyle.rainbow:
        _paintSilver(canvas, size, _paintRainbowFill);
      case GameXpBarStyle.orange:
        _paintSilver(canvas, size, _paintSegmentedFill);
      case GameXpBarStyle.fire:
        _paintFire(canvas, size);
    }
  }

  // ---------------------------------------------------------------- tube ---

  /// Blue / purple look: a colored tube frame around a white center, filled
  /// by a glossy pill.
  void _paintTube(Canvas canvas, Size size, Color tube, Color fillFace) {
    final h = size.height;
    final outer = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(h * 0.02),
      Radius.circular(h / 2),
    );

    if (!fill) {
      final rimWidth = h * 0.14;
      // Tube body.
      canvas.drawRRect(outer, Paint()..color = tube);
      // Light catch along the tube's top.
      canvas.drawRRect(
        outer.deflate(rimWidth * 0.30),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = rimWidth * 0.35
          ..color = GameColors.lighten(tube, 0.28),
      );
      // White empty center.
      canvas.drawRRect(
        outer.deflate(rimWidth),
        Paint()..color = const Color(0xFFFFFFFF),
      );
      // Crisp inner edge.
      canvas.drawRRect(
        outer.deflate(rimWidth),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = h * 0.025
          ..color = GameColors.darken(tube, 0.15),
      );
      return;
    }

    _glossyPill(canvas, outer.deflate(h * 0.17), fillFace);
  }

  // -------------------------------------------------------------- silver ---

  /// Rainbow / orange look: a silver recessed track with a style-specific
  /// fill painted by [fillPainter].
  void _paintSilver(
    Canvas canvas,
    Size size,
    void Function(Canvas, RRect) fillPainter,
  ) {
    final h = size.height;
    final outer = RRect.fromRectAndRadius(
      (Offset.zero & size).deflate(h * 0.02),
      Radius.circular(h / 2),
    );

    if (!fill) {
      canvas.drawRRect(outer, Paint()..color = const Color(0xFFE8ECEF));
      canvas.drawRRect(
        outer,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = h * 0.03
          ..color = const Color(0xFFC2CAD2),
      );
      canvas.drawRRect(
        outer.deflate(h * 0.09),
        Paint()..color = const Color(0xFFF6F8FA),
      );
      canvas.drawRRect(
        outer.deflate(h * 0.09),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = h * 0.025
          ..color = const Color(0xFFAAB4BE).withValues(alpha: 0.6),
      );
      return;
    }

    fillPainter(canvas, outer.deflate(h * 0.14));
  }

  void _paintRainbowFill(Canvas canvas, RRect pill) {
    final rect = pill.outerRect;
    canvas.drawRRect(
      pill,
      Paint()
        ..shader = const LinearGradient(
          colors: [
            Color(0xFFF03E3E),
            Color(0xFFF5872B),
            Color(0xFFF7D344),
            Color(0xFF58C25A),
            Color(0xFF3EC0E8),
            Color(0xFF3E6EE8),
            Color(0xFFB44EE0),
          ],
        ).createShader(rect),
    );
    _pillGloss(canvas, pill);
    canvas.drawRRect(
      pill,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rect.height * 0.05
        ..color = const Color(0xFF6A4A78),
    );
  }

  void _paintSegmentedFill(Canvas canvas, RRect pill) {
    _segments(
      canvas,
      pill,
      rimColor: const Color(0xFFF5ECC8),
      trackColor: const Color(0xFF7E3A0E),
    );
  }

  // ---------------------------------------------------------------- fire ---

  /// Fire look: orange pennant banner + scalloped flame badge (empty layer),
  /// gold segments in the cream track (fill layer).
  void _paintFire(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;
    final track = RRect.fromRectAndRadius(
      Rect.fromLTRB(h * 1.15, h * 0.30, w - h * 0.55, h * 0.70),
      Radius.circular(h * 0.20),
    );

    if (fill) {
      _segments(
        canvas,
        track.deflate(h * 0.045),
        rimColor: const Color(0x00000000),
        trackColor: const Color(0x00000000),
      );
      return;
    }

    _fireBanner(canvas, size);
    // Cream empty track with a light ring and a brown hairline.
    canvas.drawRRect(
      track.inflate(h * 0.05),
      Paint()..color = const Color(0xFFFCF6E4),
    );
    canvas.drawRRect(track, Paint()..color = const Color(0xFFF2DFC2));
    canvas.drawRRect(
      track,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = h * 0.02
        ..color = const Color(0xFFA5561A),
    );
    _fireBadge(canvas, size);
  }

  void _fireBanner(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;
    final top = h * 0.10;
    final bottom = h * 0.90;
    final left = h * 0.55;
    final r = h * 0.12;
    final notch = h * 0.30;

    final banner = Path()
      ..moveTo(left + r, top)
      ..lineTo(w - h * 0.03, top)
      ..lineTo(w - h * 0.03 - notch, h * 0.5)
      ..lineTo(w - h * 0.03, bottom)
      ..lineTo(left + r, bottom)
      ..quadraticBezierTo(left, bottom, left, bottom - r)
      ..lineTo(left, top + r)
      ..quadraticBezierTo(left, top, left + r, top)
      ..close();

    canvas.drawPath(
      banner,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [Color(0xFFFFC93C), Color(0xFFF07800)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      banner,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = h * 0.03
        ..color = const Color(0xFFB54B00)
        ..strokeJoin = StrokeJoin.round,
    );
  }

  void _fireBadge(Canvas canvas, Size size) {
    final h = size.height;
    final center = Offset(h * 0.52, h * 0.50);
    final radius = h * 0.46;

    // Scalloped gold badge: main disc unioned with small bumps on the ring.
    var badge = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
    for (var i = 0; i < 12; i++) {
      final angle = i * math.pi / 6;
      final bump = Path()
        ..addOval(
          Rect.fromCircle(
            center:
                center +
                Offset(math.cos(angle), math.sin(angle)) * (radius * 0.94),
            radius: radius * 0.16,
          ),
        );
      badge = Path.combine(PathOperation.union, badge, bump);
    }

    canvas.drawPath(
      badge,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [Color(0xFFFFD54A), Color(0xFFF59B0D)],
        ).createShader(Rect.fromCircle(center: center, radius: radius * 1.2)),
    );
    canvas.drawPath(
      badge,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = h * 0.02
        ..color = const Color(0xFFC96A0A),
    );

    // Cream inner disc with a brown ring.
    canvas.drawCircle(
      center,
      radius * 0.78,
      Paint()..color = const Color(0xFFFBF3E2),
    );
    canvas.drawCircle(
      center,
      radius * 0.78,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.07
        ..color = const Color(0xFFB5651D),
    );

    _flame(canvas, center, radius * 1.05);
  }

  /// Three-layer cartoon flame (red → orange → yellow) plus a spark.
  void _flame(Canvas canvas, Offset center, double extent) {
    final box = Rect.fromCenter(
      center: center + Offset(0, extent * 0.02),
      width: extent,
      height: extent * 1.1,
    );

    void layer(double scale, double downShift, Color color) {
      final rect = Rect.fromCenter(
        center: box.center + Offset(0, box.height * downShift),
        width: box.width * scale,
        height: box.height * scale,
      );
      canvas.drawPath(_flamePath(rect), Paint()..color = color);
    }

    layer(1.0, 0.0, const Color(0xFFE23B2E));
    layer(0.72, 0.10, const Color(0xFFF77B1C));
    layer(0.45, 0.18, const Color(0xFFFFD34D));

    // Small drifting spark above the left shoulder.
    canvas.drawCircle(
      Offset(box.left + box.width * 0.30, box.top + box.height * 0.06),
      box.width * 0.05,
      Paint()..color = const Color(0xFFE23B2E),
    );
  }

  Path _flamePath(Rect r) {
    double x(double f) => r.left + f * r.width;
    double y(double f) => r.top + f * r.height;
    return Path()
      ..moveTo(x(0.50), y(0.04))
      ..cubicTo(x(0.62), y(0.16), x(0.84), y(0.24), x(0.80), y(0.44))
      ..cubicTo(x(0.98), y(0.52), x(0.96), y(0.74), x(0.82), y(0.86))
      ..cubicTo(x(0.72), y(0.96), x(0.28), y(0.96), x(0.18), y(0.86))
      ..cubicTo(x(0.04), y(0.74), x(0.02), y(0.52), x(0.20), y(0.44))
      ..cubicTo(x(0.16), y(0.24), x(0.38), y(0.16), x(0.50), y(0.04))
      ..close();
  }

  // -------------------------------------------------------------- shared ---

  /// Glossy pill fill: vertical gradient face, top gloss band, dark rim.
  void _glossyPill(Canvas canvas, RRect pill, Color face) {
    final rect = pill.outerRect;
    canvas.drawRRect(
      pill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            GameColors.lighten(face, 0.22),
            face,
            GameColors.darken(face, 0.12),
          ],
          stops: const [0.0, 0.45, 1.0],
        ).createShader(rect),
    );
    _pillGloss(canvas, pill);
    canvas.drawRRect(
      pill,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rect.height * 0.06
        ..color = GameColors.deepen(face, 0.30, 0.15),
    );
  }

  /// Horizontal white gloss band over a pill's top half.
  void _pillGloss(Canvas canvas, RRect pill) {
    final rect = pill.outerRect;
    canvas.save();
    canvas.clipRRect(pill);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
          rect.left + rect.height * 0.18,
          rect.top + rect.height * 0.10,
          rect.right - rect.height * 0.18,
          rect.top + rect.height * 0.42,
        ),
        Radius.circular(rect.height * 0.2),
      ),
      Paint()..color = const Color(0xFFFFFFFF).withValues(alpha: 0.40),
    );
    canvas.restore();
  }

  /// Gold-rimmed, brown-tracked row of two-tone gold cells. Transparent
  /// [rimColor]/[trackColor] skip those layers (used inside the fire track).
  void _segments(
    Canvas canvas,
    RRect pill, {
    required Color rimColor,
    required Color trackColor,
  }) {
    final rect = pill.outerRect;
    final h = rect.height;

    if (rimColor.a > 0) {
      canvas.drawRRect(pill, Paint()..color = rimColor);
    }
    final inner = pill.deflate(h * 0.10);
    if (trackColor.a > 0) {
      canvas.drawRRect(inner, Paint()..color = trackColor);
    }

    // Two-tone gold cells with a hard mid-stop, like candy segments.
    final cellArea = inner.outerRect.deflate(h * 0.06);
    const count = 7;
    final gap = h * 0.10;
    final cellWidth = (cellArea.width - gap * (count - 1)) / count;
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFE04D),
          Color(0xFFFFCF3A),
          Color(0xFFF5820D),
          Color(0xFFF5820D),
        ],
        stops: [0.0, 0.5, 0.5, 1.0],
      ).createShader(cellArea);

    canvas.save();
    canvas.clipRRect(inner.deflate(h * 0.02));
    for (var i = 0; i < count; i++) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            cellArea.left + i * (cellWidth + gap),
            cellArea.top,
            cellWidth,
            cellArea.height,
          ),
          Radius.circular(h * 0.10),
        ),
        paint,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _XpBarPainter oldDelegate) =>
      oldDelegate.style != style || oldDelegate.fill != fill;
}
