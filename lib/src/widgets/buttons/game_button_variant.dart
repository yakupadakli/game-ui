/// Visual variants of [GameButton]. Each variant decides how its background
/// renders (bundled PNG or pure code) and where its content should sit on
/// the visible face.
///
/// Currently ships [circle] (PNG-asset) and [square] (code-rendered).
/// Future variants (primary, secondary, warning, etc.) will land as the
/// asset library grows.
enum GameButtonVariant {
  /// Glossy 3D circular button — bundled PNG.
  circle(faceLiftRatio: 0.01),

  /// Glossy 3D squircle button — rendered entirely in code.
  square(faceLiftRatio: 0.0);

  const GameButtonVariant({required this.faceLiftRatio});

  /// Ratio of the button size to shift the child upward so it sits on the
  /// visible face (above the bottom depth rim).
  final double faceLiftRatio;
}
