import 'package:flutter/material.dart';

import 'game_button_palette.dart';

/// Code-rendered layered "depth" button surface shared by the rect-style
/// game buttons (the square `GameButton` variant, numpad keys, true/false
/// answers).
///
/// Layers, back to front:
/// 1. Base plate (defaults to [GameButtonPalette.depth]; override with
///    [baseColor] e.g. for selection rings).
/// 2. Inset ring (defaults to [GameButtonPalette.innerRing]; override with
///    [ringColor]).
/// 3. Radial-gradient sphere-shaded face
///    ([GameButtonPalette.highlight] → `face` → `shadow`), inset by
///    [faceInsets], holding the centered [child].
///
/// Callers own everything around the surface — tap handling, disabled
/// overlays, glows, and specular highlights — so the widget stays a pure
/// visual building block.
class GameButtonSurface extends StatelessWidget {
  const GameButtonSurface({
    required this.palette,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.depthInset,
    this.faceInsets,
    this.baseColor,
    this.ringColor,
    this.gradientCenter = const Alignment(0, -0.4),
    this.gradientRadius = 1.1,
    this.gradientStops = const [0.0, 0.55, 1.0],
    this.child,
    super.key,
  });

  final GameButtonPalette palette;
  final double width;
  final double height;

  /// Corner radius of the base plate; inner layers derive theirs from it.
  final double borderRadius;

  /// Rim thickness the layers step in by: the ring insets by half of it,
  /// the face's default insets use it on every side.
  final double depthInset;

  /// Override for the face insets (defaults to `EdgeInsets.all(depthInset)`).
  /// Rect buttons typically use a thicker bottom inset for the 3D rim.
  final EdgeInsetsGeometry? faceInsets;

  /// Override for the base plate color (defaults to [GameButtonPalette.depth]).
  final Color? baseColor;

  /// Override for the inset ring color (defaults to
  /// [GameButtonPalette.innerRing]).
  final Color? ringColor;

  final AlignmentGeometry gradientCenter;
  final double gradientRadius;
  final List<double> gradientStops;

  /// Optional content centered on the gradient face.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: baseColor ?? palette.depth,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(depthInset * 0.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ringColor ?? palette.innerRing,
                  borderRadius: BorderRadius.circular(
                    borderRadius - depthInset * 0.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: faceInsets ?? EdgeInsets.all(depthInset),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    borderRadius - depthInset,
                  ),
                  gradient: RadialGradient(
                    center: gradientCenter,
                    radius: gradientRadius,
                    colors: [palette.highlight, palette.face, palette.shadow],
                    stops: gradientStops,
                  ),
                ),
                child: child == null ? null : Center(child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
