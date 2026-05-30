import 'package:flutter/painting.dart';

/// Shared color palette for game-style widgets.
///
/// Brand colors carry the descriptive name from the design guide
/// (e.g. [vibrantBlue]). Semantic aliases ([primary], [success], …) point at
/// the same value so widgets can opt in to whichever vocabulary fits best.
abstract final class GameColors {
  GameColors._();

  // Brand palette.
  static const Color vibrantBlue = Color(0xFF4A90E2);
  static const Color sunnyYellow = Color(0xFFFFD700);
  static const Color grassGreen = Color(0xFF50C878);
  static const Color friendlyOrange = Color(0xFFFF6B6B);
  static const Color purple = Color(0xFF9B59B6);

  // Animal palette — iOS system-style colors from the secondary design guide.
  static const Color bearBlue = Color(0xFF007AFF);
  static const Color penguinGreen = Color(0xFF34C759);
  static const Color foxYellow = Color(0xFFFFCC00);
  static const Color elephantOrange = Color(0xFFFF9500);

  // Semantic aliases (mapped to the brand palette).
  static const Color primary = vibrantBlue;
  static const Color warning = sunnyYellow;
  static const Color success = grassGreen;
  static const Color danger = friendlyOrange;
  static const Color accent = purple;

  // Neutrals (inferred from the design guide scaffold + cards).
  static const Color background = Color(0xFFE8F4FD);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textNavy = Color(0xFF1A2E5C);
  static const Color disabled = Color(0xFFB0B0B0);

  /// Returns [color] darkened by [amount] (0–1) in HSL lightness space.
  /// Used to derive border/stroke shades from a single base color.
  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Returns [color] lightened by [amount] (0–1) in HSL lightness space.
  /// Used to derive gloss/highlight shades from a single base color.
  static Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}
