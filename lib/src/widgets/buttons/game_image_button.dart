import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import 'game_button_palette.dart';
import 'game_glossy_button_surface.dart';

// Depth palettes for each button style. Colors are picked to match the glossy
// game-art look the widget used to load from PNGs.
const GameButtonPalette _blueRect = GameButtonPalette(
  face: Color(0xFF29A9F0),
  depth: Color(0xFF0E7AC0),
  innerRing: Color(0xFF0C6BAA),
  highlight: Color(0xFF9FDBFF),
  shadow: Color(0xFF1A8FD6),
  stroke: Color(0xFF0A5A92),
);
const GameButtonPalette _greenRect = GameButtonPalette(
  face: Color(0xFF8CC63F),
  depth: Color(0xFF4E9A2E),
  innerRing: Color(0xFF3E7E24),
  highlight: Color(0xFFCDE88B),
  shadow: Color(0xFF6DAF34),
  stroke: Color(0xFF356E1F),
);
const GameButtonPalette _purpleRect = GameButtonPalette(
  face: Color(0xFFB56BEE),
  depth: Color(0xFF8A3FC0),
  innerRing: Color(0xFF6E2FA0),
  highlight: Color(0xFFE0BBF7),
  shadow: Color(0xFF9B4FD4),
  stroke: Color(0xFF5A2585),
);
const GameButtonPalette _redRect = GameButtonPalette(
  face: Color(0xFFFF2E2E),
  depth: Color(0xFFC21414),
  innerRing: Color(0xFF9E0E0E),
  highlight: Color(0xFFFF9A9A),
  shadow: Color(0xFFE01E1E),
  stroke: Color(0xFF8A0A0A),
);
const GameButtonPalette _blueSphere = GameButtonPalette(
  face: Color(0xFF3E8EF0),
  depth: Color(0xFF0B2E8A),
  innerRing: Color(0xFF071E5E),
  highlight: Color(0xFF8CC6FF),
  shadow: Color(0xFF2361C8),
  stroke: Color(0xFF06215E),
);
const GameButtonPalette _whiteSphere = GameButtonPalette(
  face: Color(0xFFF3ECDD),
  depth: Color(0xFFA6A6A6),
  innerRing: Color(0xFF8E8E8E),
  highlight: Color(0xFFFFFFFF),
  shadow: Color(0xFFD2C9B8),
  stroke: Color(0xFF909090),
);
const GameButtonPalette _greenSquare = GameButtonPalette(
  face: Color(0xFF5CC271),
  depth: Color(0xFF2E7D40),
  innerRing: Color(0xFF236331),
  highlight: Color(0xFFB6ECC0),
  shadow: Color(0xFF3EA157),
  stroke: Color(0xFF1E5A2E),
);
const GameButtonPalette _orangeSquare = GameButtonPalette(
  face: Color(0xFFFF9E1B),
  depth: Color(0xFFCB6A0E),
  innerRing: Color(0xFF9E4E08),
  highlight: Color(0xFFFFD08A),
  shadow: Color(0xFFE87C10),
  stroke: Color(0xFF7A3E06),
);
const GameButtonPalette _redSquare = GameButtonPalette(
  face: Color(0xFFF04848),
  depth: Color(0xFFB01212),
  innerRing: Color(0xFF8E0E0E),
  highlight: Color(0xFFFF9C9C),
  shadow: Color(0xFFD62F2F),
  stroke: Color(0xFF7E0A0A),
);
const GameButtonPalette _orangePill = GameButtonPalette(
  face: Color(0xFFFFB020),
  depth: Color(0xFF8A3B0A),
  innerRing: Color(0xFFB35410),
  highlight: Color(0xFFFFDE6E),
  shadow: Color(0xFFFF7A00),
  stroke: Color(0xFF7A3305),
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
  face: Color(0x2EFFFFFF),
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
  squareBlueGlossy(shape: GameGlossyButtonShape.squircle, palette: _blueSphere),
  squareGreenGlossy(
    shape: GameGlossyButtonShape.squircle,
    palette: _greenSquare,
    whiteBorder: true,
  ),
  squareOrangeGlossy(
    shape: GameGlossyButtonShape.squircle,
    palette: _orangeSquare,
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
    aspect: 3.6,
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
    final badge = _badge;
    Widget content = Stack(
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
        if (badge != _Decoration.none)
          _Badge(decoration: badge, buttonHeight: size.height),
        if (child != null) Padding(padding: padding, child: child),
      ],
    );

    if (semanticLabel != null) {
      content = Semantics(label: semanticLabel, button: true, child: content);
    }
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }
}

/// Green glossy badge baked into the orange pill styles — a play button
/// ([_Decoration.play]) pinned mid-left, or a small status dot
/// ([_Decoration.dot]) riding the pill's bottom-left corner.
class _Badge extends StatelessWidget {
  const _Badge({required this.decoration, required this.buttonHeight});

  final _Decoration decoration;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    final isPlay = decoration == _Decoration.play;
    final d = buttonHeight * (isPlay ? 0.9 : 0.36);
    return Positioned(
      left: buttonHeight * (isPlay ? 0.14 : 0.12),
      top: isPlay ? null : buttonHeight * 0.58,
      child: SizedBox(
        width: d,
        height: d,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GameGlossyButtonSurface(
              width: d,
              height: d,
              palette: _greenSphere,
              shape: GameGlossyButtonShape.circle,
            ),
            if (isPlay)
              CustomPaint(
                size: Size.square(d),
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
