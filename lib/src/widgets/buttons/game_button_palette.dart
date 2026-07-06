import 'package:flutter/painting.dart';

/// Color set for the layered "depth" button look shared by game buttons
/// (numpad keys, true/false answers, square button face).
///
/// Layers, back to front: [depth] base → [innerRing] inset → radial gradient
/// face ([highlight] → [face] → [shadow]). [stroke] outlines the label text.
class GameButtonPalette {
  const GameButtonPalette({
    required this.face,
    required this.depth,
    required this.innerRing,
    required this.highlight,
    required this.shadow,
    required this.stroke,
  });

  /// Mid-tone base color of the gradient face.
  final Color face;

  /// Darkest tone, used for the bottom depth rim.
  final Color depth;

  /// Inset ring tone, slightly lighter than [depth].
  final Color innerRing;

  /// Lightest tone, top of the radial gradient (specular).
  final Color highlight;

  /// Bottom tone of the radial gradient.
  final Color shadow;

  /// Outline color for the stroked label text.
  final Color stroke;

  /// The brand-blue rect-button palette shared by the square `GameButton`
  /// variant and numeric `GameNumpadButton` keys.
  static const GameButtonPalette blue = GameButtonPalette(
    face: Color(0xFF4A90FF),
    depth: Color(0xFF1E5BCC),
    innerRing: Color(0xFF0030A0),
    highlight: Color(0xFF80C8FF),
    shadow: Color(0xFF3070D0),
    stroke: Color(0xFF003E91),
  );
}
