import 'package:flutter/material.dart';

import 'game_colors.dart';
import 'game_design_tokens.dart';
import 'game_text_styles.dart';

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
    // Seed a full M3 tonal palette from the brand blue so every role
    // (containers, outline, tertiary, …) derives from the brand hue instead of
    // Flutter's default purple, then override the exact brand roles.
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: GameColors.primary,
          brightness: Brightness.light,
        ).copyWith(
          primary: GameColors.primary,
          onPrimary: GameColors.textOnPrimary,
          secondary: GameColors.accent,
          onSecondary: GameColors.textOnPrimary,
          error: GameColors.danger,
          onError: GameColors.textOnPrimary,
          surface: GameColors.surface,
          onSurface: GameColors.textPrimary,
        );

    return ThemeData(
      useMaterial3: true,
      fontFamily: GameDesignTokens.fontFamily,
      scaffoldBackgroundColor: GameColors.background,
      colorScheme: colorScheme,
      // Map the surface-text (textPrimary) styles onto their Material slots.
      // [GameTextStyles.buttonLabel]/[GameTextStyles.displayLabel] are left out:
      // the former is on-primary white (unreadable on surfaces) and the latter
      // uses the display font, which the global [fontFamily] would override.
      textTheme: const TextTheme(
        headlineLarge: GameTextStyles.heading1,
        headlineMedium: GameTextStyles.heading2,
        titleMedium: GameTextStyles.bodyBold,
        bodyLarge: GameTextStyles.body,
      ),
      extensions: defaults(),
    );
  }
}
