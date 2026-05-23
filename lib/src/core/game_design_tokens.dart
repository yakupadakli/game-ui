/// Shared design tokens for game-style widgets.
///
/// Spacing scale, font sizes, and tap-target sizes that every widget should
/// pull from to keep the UI visually consistent.
abstract final class GameDesignTokens {
  GameDesignTokens._();

  // Spacing scale (logical pixels).
  static const double spacingXs = 6;
  static const double spacingSm = 8;
  static const double spacingMd = 12;
  static const double spacingLg = 16;
  static const double spacingXl = 24;
  static const double spacingXxl = 32;

  // Font size scale.
  static const double fontSizeSm = 13;
  static const double fontSizeMd = 14;
  static const double fontSizeLg = 16;
  static const double fontSizeXl = 18;

  // Tap target sizes.
  static const double tapTargetDefault = 48;
  static const double tapTargetCompact = 32;
}
