/// Shared design tokens for game-style widgets.
///
/// Spacing scale, font sizes, and tap-target sizes that every widget should
/// pull from to keep the UI visually consistent.
abstract final class GameDesignTokens {
  GameDesignTokens._();

  // Spacing scale (logical pixels).
  static const double spacingXS = 6;
  static const double spacingSM = 8;
  static const double spacingMD = 12;
  static const double spacingLG = 16;
  static const double spacingXL = 24;
  static const double spacingXXL = 32;

  // Font size scale.
  static const double fontSM = 13;
  static const double fontMD = 14;
  static const double fontLG = 16;
  static const double fontXL = 18;
  static const double font2XL = 22;
  static const double font3XL = 28;

  // Tap target sizes.
  static const double tapTargetDefault = 48;
  static const double tapTargetCompact = 32;

  // Border radius scale.
  static const double radiusSM = 8;
  static const double radiusMD = 16;
  static const double radiusLG = 24;
  static const double radiusPill = 999;

  /// Default font family bundled with the package.
  /// Consumers may override via [TextStyle.fontFamily] on their own widgets.
  static const String fontFamily = 'Fredoka';

  /// Chunky display font for stroked button/number labels (e.g. numpad keys,
  /// true/false buttons, badges).
  static const String fontFamilyDisplay = 'BalooChettan2';
}
