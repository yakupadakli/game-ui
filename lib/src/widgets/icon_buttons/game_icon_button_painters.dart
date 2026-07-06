part of 'game_icon_button.dart';

/// Which glyph an icon-button variant draws.
enum _IconGlyph { home, book, gear, play }

/// Palette + style for one icon-button variant.
class _IconSpec {
  const _IconSpec({
    required this.glyph,
    required this.primary,
    required this.stroke,
    this.secondary = const Color(0xFFFFFFFF),
    this.accent = const Color(0xFFFFFFFF),
    this.outline = false,
    this.mono = false,
  });

  final _IconGlyph glyph;

  /// Main color: roof / cover / gear face / play disc.
  final Color primary;

  /// Support color: house body / page fill.
  final Color secondary;

  /// Detail color: door / text lines / play triangle.
  final Color accent;

  /// Outline color (the only color used when [outline] is true).
  final Color stroke;

  /// Stroke-only rendering (no fills except white pages).
  final bool outline;

  /// Single-color glossy slab treatment (the green home button).
  final bool mono;

  static const book = _IconSpec(
    glyph: _IconGlyph.book,
    primary: Color(0xFF9C27C8),
    accent: Color(0xFFA855D8),
    stroke: Color(0xFF581878),
  );
  static const bookBlueOutline = _IconSpec(
    glyph: _IconGlyph.book,
    primary: Color(0xFF2E5FA3),
    accent: Color(0xFF2E5FA3),
    stroke: Color(0xFF2E5FA3),
    outline: true,
  );
  static const bookGray = _IconSpec(
    glyph: _IconGlyph.book,
    primary: Color(0xFFABA6C0),
    accent: Color(0xFF9E9AAE),
    stroke: Color(0xFF8B87A0),
  );
  static const bookPurpleV2 = _IconSpec(
    glyph: _IconGlyph.book,
    primary: Color(0xFFB03BE8),
    accent: Color(0xFF8E88B0),
    stroke: Color(0xFF4E4A6A),
  );
  static const home = _IconSpec(
    glyph: _IconGlyph.home,
    primary: Color(0xFF8BC832),
    stroke: Color(0xFF2E6B14),
    mono: true,
  );
  static const homeBlue = _IconSpec(
    glyph: _IconGlyph.home,
    primary: Color(0xFF4A7EC2),
    secondary: Color(0xFFBEE0F5),
    accent: Color(0xFFE8A85C),
    stroke: Color(0xFF2E5C94),
  );
  static const homeOutline = _IconSpec(
    glyph: _IconGlyph.home,
    primary: Color(0xFF3A69AC),
    stroke: Color(0xFF3A69AC),
    outline: true,
  );
  static const homePink = _IconSpec(
    glyph: _IconGlyph.home,
    primary: Color(0xFFF48FA0),
    secondary: Color(0xFFFFFFFF),
    accent: Color(0xFFA8C8D8),
    stroke: Color(0xFF7A828A),
  );
  static const homeRed = _IconSpec(
    glyph: _IconGlyph.home,
    primary: Color(0xFFE8395C),
    secondary: Color(0xFFEEF2FA),
    accent: Color(0xFF3E8EE0),
    stroke: Color(0xFF35547A),
  );
  static const playGreen = _IconSpec(
    glyph: _IconGlyph.play,
    primary: Color(0xFF58B830),
    stroke: Color(0xFF1E5A0E),
  );
  static const settings = _IconSpec(
    glyph: _IconGlyph.gear,
    primary: Color(0xFF5B8DEE),
    stroke: Color(0xFF26418F),
  );
  static const settingsGray = _IconSpec(
    glyph: _IconGlyph.gear,
    primary: Color(0xFFD5DAE5),
    stroke: Color(0xFF5E6880),
  );
  static const settingsOutlineBlue = _IconSpec(
    glyph: _IconGlyph.gear,
    primary: Color(0xFF1E88D8),
    stroke: Color(0xFF1E88D8),
    outline: true,
  );
  static const settingsWhite = _IconSpec(
    glyph: _IconGlyph.gear,
    primary: Color(0xFFF2F2F6),
    stroke: Color(0xFF9A9AA6),
  );
}

/// Draws the glyph for one [_IconSpec] in a square canvas. All geometry is
/// authored in a 0..1 unit space and scaled to the canvas size.
class _IconGlyphPainter extends CustomPainter {
  const _IconGlyphPainter(this.spec);

  final _IconSpec spec;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.shortestSide);
    switch (spec.glyph) {
      case _IconGlyph.home:
        _paintHome(canvas);
      case _IconGlyph.book:
        _paintBook(canvas);
      case _IconGlyph.gear:
        _paintGear(canvas);
      case _IconGlyph.play:
        _paintPlay(canvas);
    }
    canvas.restore();
  }

  Color _lighten(Color c, double amount) {
    final hsl = HSLColor.fromColor(c);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color _darken(Color c, double amount) => _lighten(c, -amount);

  // ---------------------------------------------------------------- home ---

  Path get _houseBody => Path()
    ..moveTo(0.22, 0.50)
    ..lineTo(0.50, 0.28)
    ..lineTo(0.78, 0.50)
    ..lineTo(0.78, 0.84)
    ..quadraticBezierTo(0.78, 0.90, 0.72, 0.90)
    ..lineTo(0.28, 0.90)
    ..quadraticBezierTo(0.22, 0.90, 0.22, 0.84)
    ..close();

  Path get _door => Path()
    ..moveTo(0.42, 0.90)
    ..lineTo(0.42, 0.68)
    ..quadraticBezierTo(0.42, 0.60, 0.50, 0.60)
    ..quadraticBezierTo(0.58, 0.60, 0.58, 0.68)
    ..lineTo(0.58, 0.90)
    ..close();

  Path get _roofBeam => Path()
    ..moveTo(0.10, 0.52)
    ..lineTo(0.50, 0.16)
    ..lineTo(0.90, 0.52);

  void _paintHome(Canvas canvas) {
    if (spec.outline) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.07
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = spec.stroke;
      canvas.drawPath(_houseBody, paint);
      canvas.drawPath(_door, paint);
      // Chimney.
      canvas.drawRect(const Rect.fromLTRB(0.70, 0.18, 0.80, 0.36), paint);
      canvas.drawPath(_roofBeam, paint);
      return;
    }

    final bodyColor = spec.mono ? _lighten(spec.primary, 0.10) : spec.secondary;
    final doorColor = spec.mono ? _darken(spec.primary, 0.30) : spec.accent;
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.035
      ..strokeJoin = StrokeJoin.round
      ..color = spec.stroke;

    // Chimney behind the roof beam.
    final chimney = RRect.fromRectAndRadius(
      const Rect.fromLTRB(0.70, 0.16, 0.81, 0.40),
      const Radius.circular(0.02),
    );
    canvas.drawRRect(chimney, Paint()..color = spec.primary);
    canvas.drawRRect(chimney, outline);

    // Body with a soft vertical gradient, then the door.
    canvas.drawPath(
      _houseBody,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [_lighten(bodyColor, 0.08), _darken(bodyColor, 0.04)],
        ).createShader(const Rect.fromLTRB(0, 0, 1, 1)),
    );
    canvas.drawPath(_houseBody, outline);
    canvas.drawPath(_door, Paint()..color = doorColor);
    canvas.drawPath(_door, outline);

    // Roof beam: dark casing with the primary color inside.
    canvas.drawPath(
      _roofBeam,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.15
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = spec.stroke,
    );
    canvas.drawPath(
      _roofBeam,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.10
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = spec.primary,
    );

    // Gloss streak on the roof's left slope.
    canvas.drawPath(
      Path()
        ..moveTo(0.26, 0.34)
        ..lineTo(0.42, 0.21),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.035
        ..strokeCap = StrokeCap.round
        ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.75),
    );
  }

  // ---------------------------------------------------------------- book ---

  /// Open-page silhouette: two wings meeting at the spine, in [rect].
  Path _pages(Rect r) {
    double x(double f) => r.left + f * r.width;
    double y(double f) => r.top + f * r.height;
    return Path()
      ..moveTo(x(0.50), y(0.18))
      ..cubicTo(x(0.36), y(0.06), x(0.18), y(0.04), x(0.08), y(0.10))
      ..lineTo(x(0.08), y(0.78))
      ..cubicTo(x(0.22), y(0.74), x(0.40), y(0.80), x(0.50), y(0.92))
      ..cubicTo(x(0.60), y(0.80), x(0.78), y(0.74), x(0.92), y(0.78))
      ..lineTo(x(0.92), y(0.10))
      ..cubicTo(x(0.82), y(0.04), x(0.64), y(0.06), x(0.50), y(0.18))
      ..close();
  }

  void _paintBook(Canvas canvas) {
    const box = Rect.fromLTRB(0.08, 0.14, 0.92, 0.88);

    if (spec.outline) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.045
        ..strokeJoin = StrokeJoin.round
        ..color = spec.stroke;
      canvas.drawPath(_pages(box), Paint()..color = const Color(0xFFFFFFFF));
      canvas.drawPath(_pages(box), paint);
      _spineAndLines(canvas, box, spec.stroke);
      return;
    }

    // Cover slab under the pages, slightly larger and shifted down.
    final cover = box.inflate(0.075).shift(const Offset(0, 0.02));
    canvas.drawPath(_pages(cover), Paint()..color = spec.primary);
    canvas.drawPath(
      _pages(cover),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.035
        ..strokeJoin = StrokeJoin.round
        ..color = spec.stroke,
    );

    // Stacked under-page edge, then the white pages.
    canvas.drawPath(
      _pages(box.inflate(0.03).shift(const Offset(0, 0.012))),
      Paint()..color = const Color(0xFFE6E4EE),
    );
    canvas.drawPath(_pages(box), Paint()..color = const Color(0xFFFFFFFF));
    canvas.drawPath(
      _pages(box),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.02
        ..color = _darken(spec.primary, 0.10),
    );
    _spineAndLines(canvas, box, spec.accent);
  }

  /// Spine crease and four curved text lines per page.
  void _spineAndLines(Canvas canvas, Rect box, Color color) {
    double x(double f) => box.left + f * box.width;
    double y(double f) => box.top + f * box.height;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.032
      ..strokeCap = StrokeCap.round
      ..color = color;

    paint.strokeWidth = 0.02;
    canvas.drawLine(Offset(x(0.50), y(0.20)), Offset(x(0.50), y(0.90)), paint);

    paint.strokeWidth = 0.032;
    for (var i = 0; i < 4; i++) {
      final t = 0.24 + i * 0.15;
      // Left page line, following the page's upward curve.
      canvas.drawPath(
        Path()
          ..moveTo(x(0.16), y(t + 0.03))
          ..quadraticBezierTo(x(0.30), y(t - 0.02), x(0.42), y(t)),
        paint,
      );
      // Right page line, mirrored.
      canvas.drawPath(
        Path()
          ..moveTo(x(0.58), y(t))
          ..quadraticBezierTo(x(0.70), y(t - 0.02), x(0.84), y(t + 0.03)),
        paint,
      );
    }
  }

  // ---------------------------------------------------------------- gear ---

  /// Gear silhouette: a base disc unioned with rounded teeth, with the axle
  /// hole punched out via even-odd fill.
  Path _gearPath() {
    var gear = Path()
      ..addOval(Rect.fromCircle(center: const Offset(0.5, 0.5), radius: 0.34));
    const teeth = 9;
    for (var i = 0; i < teeth; i++) {
      final angle = i * 2 * math.pi / teeth;
      // One tooth authored at angle 0 (pointing right), then rotated into
      // place about the gear center.
      final tooth = Path()
        ..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: const Offset(0.90, 0.5),
              width: 0.16,
              height: 0.17,
            ),
            const Radius.circular(0.045),
          ),
        );
      final m = Matrix4.identity()
        ..translateByDouble(0.5, 0.5, 0, 1)
        ..rotateZ(angle)
        ..translateByDouble(-0.5, -0.5, 0, 1);
      gear = Path.combine(
        PathOperation.union,
        gear,
        tooth.transform(m.storage),
      );
    }
    return gear;
  }

  void _paintGear(Canvas canvas) {
    final gear = _gearPath();

    if (spec.outline) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.04
        ..strokeJoin = StrokeJoin.round
        ..color = spec.stroke;
      canvas.drawPath(gear, paint);
      canvas.drawCircle(const Offset(0.5, 0.5), 0.21, paint);
      canvas.drawCircle(const Offset(0.5, 0.5), 0.12, paint);
      return;
    }

    // Punch the axle hole, then fill with a soft diagonal gradient.
    final silhouette = Path.combine(
      PathOperation.difference,
      gear,
      Path()..addOval(
        Rect.fromCircle(center: const Offset(0.5, 0.5), radius: 0.115),
      ),
    );
    canvas.drawPath(
      silhouette,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_lighten(spec.primary, 0.18), _darken(spec.primary, 0.08)],
        ).createShader(const Rect.fromLTRB(0, 0, 1, 1)),
    );
    final outline = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.035
      ..strokeJoin = StrokeJoin.round
      ..color = spec.stroke;
    canvas.drawPath(gear, outline);

    // Concentric hub rings + axle hole edge.
    canvas.drawCircle(
      const Offset(0.5, 0.5),
      0.21,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.045
        ..color = _darken(spec.primary, 0.18),
    );
    canvas.drawCircle(const Offset(0.5, 0.5), 0.115, outline);

    // Gloss streak on the upper-left teeth.
    canvas.drawPath(
      Path()
        ..moveTo(0.22, 0.30)
        ..quadraticBezierTo(0.28, 0.20, 0.40, 0.16),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.035
        ..strokeCap = StrokeCap.round
        ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.65),
    );
  }

  // ---------------------------------------------------------------- play ---

  void _paintPlay(Canvas canvas) {
    const center = Offset(0.5, 0.5);

    // Glossy disc.
    canvas.drawCircle(
      center,
      0.46,
      Paint()
        ..shader = RadialGradient(
          center: const Alignment(-0.35, -0.45),
          radius: 1.1,
          colors: [
            _lighten(spec.primary, 0.25),
            spec.primary,
            _darken(spec.primary, 0.12),
          ],
          stops: const [0.0, 0.55, 1.0],
        ).createShader(Rect.fromCircle(center: center, radius: 0.46)),
    );
    canvas.drawCircle(
      center,
      0.46,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.05
        ..color = spec.stroke,
    );

    // Rounded triangle, nudged right so it reads centered.
    final triangle = _roundedTriangle(const [
      Offset(0.40, 0.30),
      Offset(0.40, 0.70),
      Offset(0.72, 0.50),
    ], 0.05);
    canvas.drawPath(
      triangle,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.06
        ..strokeJoin = StrokeJoin.round
        ..color = _darken(spec.primary, 0.28),
    );
    canvas.drawPath(triangle, Paint()..color = spec.accent);

    // Specular sheens.
    canvas.save();
    canvas.translate(0.30, 0.24);
    canvas.rotate(-0.6);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: 0.20, height: 0.09),
      Paint()..color = const Color(0xFFFFFFFF).withValues(alpha: 0.8),
    );
    canvas.restore();
    canvas.save();
    canvas.translate(0.28, 0.76);
    canvas.rotate(0.5);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: 0.14, height: 0.06),
      Paint()..color = const Color(0xFFFFFFFF).withValues(alpha: 0.35),
    );
    canvas.restore();
  }

  /// A triangle whose corners are rounded by pulling each vertex toward its
  /// neighbors and bridging with a quadratic curve.
  Path _roundedTriangle(List<Offset> points, double radius) {
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final current = points[i];
      final previous = points[(i - 1 + points.length) % points.length];
      final next = points[(i + 1) % points.length];
      final fromPrev = (current - previous);
      final toNext = (next - current);
      final entry = current - fromPrev / fromPrev.distance * radius;
      final exit = current + toNext / toNext.distance * radius;
      if (i == 0) {
        path.moveTo(entry.dx, entry.dy);
      } else {
        path.lineTo(entry.dx, entry.dy);
      }
      path.quadraticBezierTo(current.dx, current.dy, exit.dx, exit.dy);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _IconGlyphPainter oldDelegate) =>
      oldDelegate.spec != spec;
}
