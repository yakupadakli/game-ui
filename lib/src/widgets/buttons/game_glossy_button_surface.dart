import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import 'game_button_palette.dart';

/// Silhouette of a code-rendered glossy button background.
enum GameGlossyButtonShape {
  /// Perfect circle — glossy sphere look.
  circle,

  /// Rounded square with a large corner radius.
  squircle,

  /// Wide rounded rectangle (color call-to-action buttons).
  roundedRect,

  /// Fully-rounded horizontal pill.
  pill,
}

/// A pure-code glossy game-button background: a stack of a depth rim, an inset
/// inner ring, a gradient face (radial for round shapes, vertical for
/// rectangular ones), and a curved specular sheen in the upper corners.
///
/// This replaces the bundled button PNGs — see [GameButtonPalette] for the
/// per-color tones. It is background only; callers overlay their own label /
/// icon on top.
class GameGlossyButtonSurface extends StatelessWidget {
  const GameGlossyButtonSurface({
    required this.width,
    required this.height,
    required this.palette,
    this.shape = GameGlossyButtonShape.roundedRect,
    this.whiteBorder = false,
    this.outlineOnly = false,
    this.glow,
    super.key,
  });

  final double width;
  final double height;
  final GameButtonPalette palette;
  final GameGlossyButtonShape shape;

  /// Draws an outer white "sticker" ring around the button (as on the rect
  /// color buttons and the glossy green square).
  final bool whiteBorder;

  /// Renders only a rounded outline with a transparent fill (the
  /// `outlineWhite` style).
  final bool outlineOnly;

  /// Optional outer glow color (a soft [BoxShadow]).
  final Color? glow;

  bool get _isRound =>
      shape == GameGlossyButtonShape.circle ||
      shape == GameGlossyButtonShape.squircle;

  double _radius(double s) => switch (shape) {
    GameGlossyButtonShape.circle => s / 2,
    GameGlossyButtonShape.squircle => s * 0.28,
    GameGlossyButtonShape.roundedRect => s * 0.24,
    GameGlossyButtonShape.pill => math.min(width, height) / 2,
  };

  @override
  Widget build(BuildContext context) {
    final s = math.min(width, height);
    final r = _radius(s);

    if (outlineOnly) {
      return SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: palette.face,
            borderRadius: BorderRadius.circular(r),
            border: Border.all(color: palette.stroke, width: s * 0.035),
          ),
        ),
      );
    }

    final border = whiteBorder ? s * 0.06 : 0.0;
    final di = s * 0.05; // inner-ring / face inset

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          if (glow != null)
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.all(s * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(r),
                  boxShadow: [
                    BoxShadow(
                      color: glow!.withValues(alpha: 0.5),
                      blurRadius: s * 0.15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          if (whiteBorder)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(r + border),
                ),
              ),
            ),
          // Depth rim (darkest tone).
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(border),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: palette.depth,
                  borderRadius: BorderRadius.circular(r),
                ),
              ),
            ),
          ),
          // Inner ring, slightly inset.
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(border + di * 0.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: palette.innerRing,
                  borderRadius: BorderRadius.circular(r - di * 0.5),
                ),
              ),
            ),
          ),
          // Gradient face, lifted to reveal the bottom depth rim.
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                top: border + di * 0.6,
                left: border + di,
                right: border + di,
                bottom: border + di * 1.8,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(r - di),
                  gradient: _faceGradient(),
                ),
              ),
            ),
          ),
          // Upper-left specular sheen.
          _sheen(s, alignRight: false),
          if (shape == GameGlossyButtonShape.pill) _sheen(s, alignRight: true),
        ],
      ),
    );
  }

  Gradient _faceGradient() {
    final colors = [palette.highlight, palette.face, palette.shadow];
    if (_isRound) {
      return RadialGradient(
        center: const Alignment(-0.1, -0.4),
        radius: 1.1,
        colors: colors,
        stops: const [0.0, 0.55, 1.0],
      );
    }
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: colors,
      stops: const [0.0, 0.45, 1.0],
    );
  }

  Widget _sheen(double s, {required bool alignRight}) {
    final w = _isRound ? s * 0.34 : s * 0.26;
    final h = s * 0.15;
    final inset = s * (_isRound ? 0.16 : 0.12);
    return Positioned(
      top: s * 0.13,
      left: alignRight ? null : inset,
      right: alignRight ? inset : null,
      child: Transform.rotate(
        angle: alignRight ? 0.6 : -0.6,
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(s * 0.1),
            gradient: RadialGradient(
              colors: [
                const Color(0xFFFFFFFF).withValues(alpha: 0.9),
                const Color(0xFFFFFFFF).withValues(alpha: 0.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
