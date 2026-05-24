import 'package:flutter/material.dart';

import 'game_colors.dart';
import 'game_design_tokens.dart';

/// Aggregator for `game_ui` theme helpers.
///
/// Exposes a [lightTheme] factory wired to [GameColors] and the bundled
/// [GameDesignTokens.fontFamily], plus a [defaults] list for per-widget
/// [ThemeExtension]s populated as categories land.
abstract final class GameTheme {
  GameTheme._();

  /// Per-widget [ThemeExtension]s. Currently empty — populated as widget
  /// categories (`GameButtonTheme`, `GameCardTheme`, …) are added.
  static List<ThemeExtension<dynamic>> defaults() =>
      const <ThemeExtension<dynamic>>[];

  /// Default light [ThemeData] for apps consuming `game_ui`. Apps may use it
  /// directly via `MaterialApp(theme: GameTheme.lightTheme())` or copy and
  /// override specific fields.
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GameDesignTokens.fontFamily,
      scaffoldBackgroundColor: GameColors.background,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: GameColors.primary,
        onPrimary: GameColors.textOnPrimary,
        secondary: GameColors.accent,
        onSecondary: GameColors.textOnPrimary,
        error: GameColors.danger,
        onError: GameColors.textOnPrimary,
        surface: GameColors.surface,
        onSurface: GameColors.textPrimary,
      ),
      extensions: defaults(),
    );
  }
}
