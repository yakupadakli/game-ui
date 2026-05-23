import 'package:flutter/material.dart';

/// Aggregator for `game_ui` [ThemeExtension]s.
///
/// As widget categories add their own `ThemeExtension` subclasses (e.g.
/// `GameButtonTheme`, `GameDividerTheme`), expose a `GameTheme.defaults()`
/// helper here that bundles them into a single `ThemeData.extensions` list.
abstract final class GameTheme {
  GameTheme._();

  /// Default set of `game_ui` theme extensions. Currently empty —
  /// populated as widget categories are implemented.
  static List<ThemeExtension<dynamic>> defaults() => const [];
}
