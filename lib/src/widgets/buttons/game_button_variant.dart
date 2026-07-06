/// Visual variants of [GameButton]. Each variant decides which glossy
/// silhouette renders behind the content and where that content should sit on
/// the visible face. Both variants are drawn entirely in code (no PNG assets).
///
/// Currently ships [circle] and [square]. Future variants (primary,
/// secondary, warning, etc.) will land as the palette library grows.
enum GameButtonVariant {
  /// Glossy 3D circular button — rendered entirely in code.
  circle(faceLiftRatio: 0.01),

  /// Glossy 3D squircle button — rendered entirely in code.
  square(faceLiftRatio: 0.0);

  const GameButtonVariant({required this.faceLiftRatio});

  /// Ratio of the button size to shift the child upward so it sits on the
  /// visible face (above the bottom depth rim).
  final double faceLiftRatio;
}
