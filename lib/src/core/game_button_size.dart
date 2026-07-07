/// Shared size scale for square game buttons (visual edge length, logical
/// pixels).
///
/// Every square button — [GameButton], [GameTileButton],
/// [GameDifficultyButton], [GameReturnButton] — pulls from this one ramp so
/// sizing stays consistent across the library. Each widget picks its own
/// sensible default from the scale; the `size` parameters also accept any raw
/// number for full control.
///
/// The ramp spans from a compact back-button size up to a large tile:
/// `extraSmall 48 · small 64 · medium 88 · large 112 · extraLarge 140 ·
/// extraExtraLarge 168`.
abstract final class GameButtonSize {
  GameButtonSize._();

  static const double extraSmall = 48;
  static const double small = 64;
  static const double medium = 88;
  static const double large = 112;
  static const double extraLarge = 140;
  static const double extraExtraLarge = 168;
}
