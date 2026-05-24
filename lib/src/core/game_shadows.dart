import 'package:flutter/painting.dart';

/// Shared shadow tokens for game-style widgets.
///
/// All shadows are soft drops biased downward — matching the cartoon
/// "lifted card" feel of the reference design.
abstract final class GameShadows {
  GameShadows._();

  /// Subtle drop for cards and panels on the [GameColors.background] surface.
  static const List<BoxShadow> card = [
    BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4)),
  ];

  /// Slightly stronger drop for pill buttons in their default (raised) state.
  static const List<BoxShadow> button = [
    BoxShadow(color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 4)),
  ];
}
