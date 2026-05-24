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
  static const Color disabled = Color(0xFFB0B0B0);
}
