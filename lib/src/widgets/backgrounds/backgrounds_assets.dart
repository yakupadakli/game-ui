import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled full-screen background image paths.
abstract final class BackgroundAssets {
  BackgroundAssets._();

  static const String _root = '$kGameAssetRoot/backgrounds';

  /// Generic decorated backgrounds — pick the one that matches the screen's
  /// tone (calm / playful / hero / dramatic).
  static const String bg1 = '$_root/bg_1.png';
  static const String bg2 = '$_root/bg_2.png';
  static const String bg3 = '$_root/bg_3.png';
  static const String bg4 = '$_root/bg_4.png';

  /// Confetti-style "you did it" background for end-of-level / win screens.
  static const String congrats = '$_root/bg_congrats.png';

  /// Star-pattern background for night / cosmic themed surfaces.
  static const String stars = '$_root/bg_stars.png';

  /// All bundled backgrounds in declaration order — handy for previews.
  static const List<String> all = [bg1, bg2, bg3, bg4, congrats, stars];
}
