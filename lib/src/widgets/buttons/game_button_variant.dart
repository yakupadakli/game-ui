import 'buttons_assets.dart';

/// Visual variants of [GameButton]. Each variant binds to a bundled PNG asset
/// and the per-asset face-lift ratio used to center [GameButton.child] on the
/// visible face (above the depth rim baked into the PNG).
///
/// Currently only [circle] is implemented. Future variants (primary,
/// secondary, warning, etc.) will be added as the asset library grows.
enum GameButtonVariant {
  /// Glossy 3D circular button.
  circle(assetPath: ButtonAssets.circle, faceLiftRatio: 0.01);

  const GameButtonVariant({
    required this.assetPath,
    required this.faceLiftRatio,
  });

  /// Bundled PNG asset path for this variant.
  final String assetPath;

  /// Ratio of the button size to shift the child upward so it sits on the
  /// visible face of the PNG (above the bottom depth rim).
  final double faceLiftRatio;
}
