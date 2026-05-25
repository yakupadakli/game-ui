import 'package:flutter/painting.dart';

/// Shared gradient tokens for game-style backgrounds and surfaces.
///
/// Approximate hex values from the design guide; tune as the visual spec
/// stabilizes.
abstract final class GameGradients {
  GameGradients._();

  /// Lightest soft blue band — pale powder, subtle horizontal sweep.
  static const LinearGradient softBlue1 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFDCE9F5), Color(0xFFBED4ED)],
  );

  /// Mid soft blue band.
  static const LinearGradient softBlue2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFA9C7E8), Color(0xFF7DA8D8)],
  );

  /// Deepest soft blue band — for header / hero surfaces.
  static const LinearGradient softBlue3 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF7DA8D8), Color(0xFF5089C7)],
  );
}
