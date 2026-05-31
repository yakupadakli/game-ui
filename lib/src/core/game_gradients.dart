import 'package:flutter/painting.dart';

import 'game_colors.dart';

/// Shared gradient tokens for game-style backgrounds and surfaces.
///
/// Bands are built from the [GameColors] soft-blue ramp so the palette stays
/// the single source of truth. Approximate values from the design guide; tune
/// as the visual spec stabilizes.
abstract final class GameGradients {
  GameGradients._();

  /// Lightest soft blue band — pale powder, subtle horizontal sweep.
  static const LinearGradient softBlue1 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [GameColors.softBlue50, GameColors.softBlue100],
  );

  /// Mid soft blue band.
  static const LinearGradient softBlue2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [GameColors.softBlue200, GameColors.softBlue300],
  );

  /// Deepest soft blue band — for header / hero surfaces.
  static const LinearGradient softBlue3 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [GameColors.softBlue300, GameColors.softBlue400],
  );

  // Semantic aliases (mapped to the soft-blue bands) — pick the vocabulary
  // that reads best at the call site.

  /// Light surface fill (alias of [softBlue1]).
  static const LinearGradient surfaceLight = softBlue1;

  /// Mid surface fill (alias of [softBlue2]).
  static const LinearGradient surfaceMid = softBlue2;

  /// Header / hero surface fill (alias of [softBlue3]).
  static const LinearGradient heroSurface = softBlue3;
}
