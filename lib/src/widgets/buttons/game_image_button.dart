import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import 'game_button_palette.dart';
import 'game_glossy_button_surface.dart';

// Depth palettes for each button style, with tones sampled from the original
// PNG art. The rect faces are nearly flat (highlight ≈ face ≈ shadow); the
// dark ring color sits in [GameButtonPalette.depth] and the lighter lip band
// in [GameButtonPalette.innerRing].
const GameButtonPalette _blueRect = GameButtonPalette(
  face: Color(0xFF11A6FF),
  depth: Color(0xFF0057AA),
  innerRing: Color(0xFF0086EA),
  highlight: Color(0xFF2BB0FF),
  shadow: Color(0xFF0D9CF2),
  stroke: Color(0xFF0057AA),
);
const GameButtonPalette _greenRect = GameButtonPalette(
  face: Color(0xFF97DD41),
  depth: Color(0xFF2A7419),
  innerRing: Color(0xFF398A28),
  highlight: Color(0xFFA2E14E),
  shadow: Color(0xFF8ED63A),
  stroke: Color(0xFF2A7419),
);
const GameButtonPalette _purpleRect = GameButtonPalette(
  face: Color(0xFFD290FF),
  depth: Color(0xFF5F2A9D),
  innerRing: Color(0xFFBC63FB),
  highlight: Color(0xFFD99CFF),
  shadow: Color(0xFFCB85FB),
  stroke: Color(0xFF5F2A9D),
);
const GameButtonPalette _redRect = GameButtonPalette(
  face: Color(0xFFFF0B0C),
  depth: Color(0xFFA50000),
  innerRing: Color(0xFF910000),
  highlight: Color(0xFFFF2222),
  shadow: Color(0xFFF50808),
  stroke: Color(0xFFA50000),
);
// Spheres: nearly flat vivid faces; the bright inner ring and deep navy edge
// come from the art's rim shading.
const GameButtonPalette _blueSphere = GameButtonPalette(
  face: Color(0xFF3A91FF),
  depth: Color(0xFF02108E),
  innerRing: Color(0xFF2470F0),
  highlight: Color(0xFF4B9EFF),
  shadow: Color(0xFF4093F8),
  stroke: Color(0xFF06215E),
);
const GameButtonPalette _whiteSphere = GameButtonPalette(
  face: Color(0xFFF8F2E9),
  depth: Color(0xFFC9C9C9),
  innerRing: Color(0xFFB0B0B0),
  highlight: Color(0xFFFFFFFF),
  shadow: Color(0xFFEFE8DC),
  stroke: Color(0xFF909090),
);
// Glossy squares: flat faces; blue/red carry a light inner ring, green and
// orange sit inside a white sticker border with a dark ring.
const GameButtonPalette _blueSquare = GameButtonPalette(
  face: Color(0xFF3D99FF),
  depth: Color(0xFF0F52E0),
  innerRing: Color(0xFF7DCAFF),
  highlight: Color(0xFF50ADFF),
  shadow: Color(0xFF3C95FF),
  stroke: Color(0xFF0030A0),
);
const GameButtonPalette _greenSquare = GameButtonPalette(
  face: Color(0xFF52B45E),
  depth: Color(0xFF1E7E33),
  innerRing: Color(0xFF2E9945),
  highlight: Color(0xFF5FBE6B),
  shadow: Color(0xFF4CAC58),
  stroke: Color(0xFF1E5A2E),
);
const GameButtonPalette _orangeSquare = GameButtonPalette(
  face: Color(0xFFFF9D2E),
  depth: Color(0xFFCE1C00),
  innerRing: Color(0xFFE85A10),
  highlight: Color(0xFFFFAC46),
  shadow: Color(0xFFFB9526),
  stroke: Color(0xFF9E3A04),
);
const GameButtonPalette _redSquare = GameButtonPalette(
  face: Color(0xFFFF5350),
  depth: Color(0xFFC41E1E),
  innerRing: Color(0xFFFE9897),
  highlight: Color(0xFFFF6663),
  shadow: Color(0xFFFE4741),
  stroke: Color(0xFF9A1414),
);
// Orange pills: strong yellow→orange vertical gradient with a deep brown lip.
const GameButtonPalette _orangePill = GameButtonPalette(
  face: Color(0xFFFFA400),
  depth: Color(0xFF7A1D00),
  innerRing: Color(0xFFA03000),
  highlight: Color(0xFFFFD70A),
  shadow: Color(0xFFFF7C00),
  stroke: Color(0xFF913400),
);
const GameButtonPalette _greenSphere = GameButtonPalette(
  face: Color(0xFF7CC142),
  depth: Color(0xFF2E6B12),
  innerRing: Color(0xFF24540E),
  highlight: Color(0xFFCDEB8B),
  shadow: Color(0xFF57962C),
  stroke: Color(0xFF1E4A0C),
);
const GameButtonPalette _outline = GameButtonPalette(
  face: Color(0x00000000),
  depth: Color(0xFFFFFFFF),
  innerRing: Color(0xFFFFFFFF),
  highlight: Color(0xFFFFFFFF),
  shadow: Color(0xFFFFFFFF),
  stroke: Color(0xFFFFFFFF),
);

/// Extra decoration baked into a style's background.
enum _Decoration { none, play, dot }

/// Code-rendered button-background styles. Each style renders a glossy game
/// button entirely in code — no PNG assets.
enum GameImageButtonStyle {
  blue(
    shape: GameGlossyButtonShape.roundedRect,
    palette: _blueRect,
    aspect: 1.5,
    whiteBorder: true,
  ),
  green(
    shape: GameGlossyButtonShape.roundedRect,
    palette: _greenRect,
    aspect: 1.5,
    whiteBorder: true,
  ),
  purple(
    shape: GameGlossyButtonShape.roundedRect,
    palette: _purpleRect,
    aspect: 1.5,
    whiteBorder: true,
  ),
  red(
    shape: GameGlossyButtonShape.roundedRect,
    palette: _redRect,
    aspect: 1.5,
    whiteBorder: true,
  ),
  circleBlueGlossy(shape: GameGlossyButtonShape.circle, palette: _blueSphere),
  circleWhiteGlossy(shape: GameGlossyButtonShape.circle, palette: _whiteSphere),
  squareBlueGlossy(shape: GameGlossyButtonShape.squircle, palette: _blueSquare),
  squareGreenGlossy(
    shape: GameGlossyButtonShape.squircle,
    palette: _greenSquare,
    whiteBorder: true,
  ),
  squareOrangeGlossy(
    shape: GameGlossyButtonShape.squircle,
    palette: _orangeSquare,
    whiteBorder: true,
  ),
  squareRedGlossy(
    shape: GameGlossyButtonShape.squircle,
    palette: _redSquare,
    glow: Color(0xFFFF5A5A),
  ),
  orangeEmpty(
    shape: GameGlossyButtonShape.pill,
    palette: _orangePill,
    aspect: 3.6,
  ),
  orangePlay(
    shape: GameGlossyButtonShape.pill,
    palette: _orangePill,
    aspect: 3.6,
  ),
  orangeWithDot(
    shape: GameGlossyButtonShape.pill,
    palette: _orangePill,
    aspect: 2.25,
  ),
  outlineWhite(
    shape: GameGlossyButtonShape.roundedRect,
    palette: _outline,
    aspect: 2.0,
    outlineOnly: true,
  );

  const GameImageButtonStyle({
    required this.shape,
    required this.palette,
    this.aspect = 1.0,
    this.whiteBorder = false,
    this.outlineOnly = false,
    this.glow,
  });

  /// Silhouette this style draws.
  final GameGlossyButtonShape shape;

  /// Depth palette for the glossy face.
  final GameButtonPalette palette;

  /// Default width / height ratio, used when only one dimension is given.
  final double aspect;

  /// Whether to draw the outer white "sticker" ring.
  final bool whiteBorder;

  /// Whether to render only a rounded outline (transparent fill).
  final bool outlineOnly;

  /// Optional outer glow color.
  final Color? glow;
}

/// Tappable glossy game button drawn entirely in code, with an optional
/// [child] (label / icon) centered on top. Press feedback comes from
/// [GameTapScale].
///
/// Sizing: pass [width] and/or [height]; whichever is omitted is derived from
/// the style's natural aspect ratio. If neither is given a default height is
/// used.
class GameImageButton extends StatelessWidget {
  const GameImageButton({
    this.style = GameImageButtonStyle.blue,
    this.onTap,
    this.child,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.semanticLabel,
    super.key,
  });

  final GameImageButtonStyle style;
  final VoidCallback? onTap;

  /// Centered overlay content (label / icon). Omit for styles that already
  /// carry their glyph (e.g. [GameImageButtonStyle.orangePlay]).
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;

  static const double _defaultHeight = 72;

  /// Baked-in badge for the composite orange-pill styles.
  _Decoration get _badge => switch (style) {
    GameImageButtonStyle.orangePlay => _Decoration.play,
    GameImageButtonStyle.orangeWithDot => _Decoration.dot,
    _ => _Decoration.none,
  };

  ({double width, double height}) get _size {
    final w = width;
    final h = height;
    if (w != null && h != null) return (width: w, height: h);
    if (w != null) return (width: w, height: w / style.aspect);
    if (h != null) return (width: h * style.aspect, height: h);
    return (width: _defaultHeight * style.aspect, height: _defaultHeight);
  }

  @override
  Widget build(BuildContext context) {
    final size = _size;
    Widget content = switch (_badge) {
      _Decoration.dot => _buildWithDot(size),
      final badge => Stack(
        alignment: Alignment.center,
        children: [
          GameGlossyButtonSurface(
            width: size.width,
            height: size.height,
            palette: style.palette,
            shape: style.shape,
            whiteBorder: style.whiteBorder,
            outlineOnly: style.outlineOnly,
            glow: style.glow,
          ),
          if (badge == _Decoration.play)
            _PlayBadge(diameter: size.height * 0.9),
          if (child != null) Padding(padding: padding, child: child),
        ],
      ),
    };

    if (semanticLabel != null) {
      content = Semantics(label: semanticLabel, button: true, child: content);
    }
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }

  /// The orangeWithDot composition from the art: the pill occupies the top
  /// band and a detached glossy dot sits below its left end.
  Widget _buildWithDot(({double width, double height}) size) {
    final pillHeight = size.height * 0.56;
    final dot = size.height * 0.32;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: pillHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GameGlossyButtonSurface(
                  width: size.width,
                  height: pillHeight,
                  palette: style.palette,
                  shape: style.shape,
                ),
                if (child != null) Padding(padding: padding, child: child),
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.035,
            top: size.height * 0.63,
            child: GameGlossyButtonSurface(
              width: dot,
              height: dot,
              palette: _greenSphere,
              shape: GameGlossyButtonShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

/// Green glossy play badge baked into the orangePlay pill, pinned mid-left.
class _PlayBadge extends StatelessWidget {
  const _PlayBadge({required this.diameter});

  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: diameter * 0.155,
      child: SizedBox(
        width: diameter,
        height: diameter,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GameGlossyButtonSurface(
              width: diameter,
              height: diameter,
              palette: _greenSphere,
              shape: GameGlossyButtonShape.circle,
            ),
            CustomPaint(
              size: Size.square(diameter),
              painter: const _PlayTrianglePainter(),
            ),
          ],
        ),
      ),
    );
  }
}

/// White rounded play triangle with a dark green casing, drawn with a path so
/// it needs no icon font.
class _PlayTrianglePainter extends CustomPainter {
  const _PlayTrianglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.shortestSide);

    // Rounded triangle: trim each vertex and bridge with a quadratic.
    const points = [Offset(0.38, 0.30), Offset(0.38, 0.70), Offset(0.74, 0.5)];
    const radius = 0.06;
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final current = points[i];
      final previous = points[(i - 1 + points.length) % points.length];
      final next = points[(i + 1) % points.length];
      final fromPrev = current - previous;
      final toNext = next - current;
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

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.08
        ..strokeJoin = StrokeJoin.round
        ..color = const Color(0xFF1E5A0E),
    );
    canvas.drawPath(path, Paint()..color = const Color(0xFFFFFFFF));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _PlayTrianglePainter oldDelegate) => false;
}
