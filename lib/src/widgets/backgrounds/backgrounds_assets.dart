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

  /// Sky / cloud scenes (landscape + portrait framings).
  static const String cloudsPortrait = '$_root/clouds_portrait.png';
  static const String skyLandscape = '$_root/sky_landscape.png';
  static const String skyPortrait = '$_root/sky_portrait.png';
  static const String skyClouds = '$_root/sky_clouds.png';
  static const String skyCloudsV2 = '$_root/sky_clouds_v2.png';
  static const String skyMath = '$_root/sky_math.png';

  /// Themed scene backdrops.
  static const String mainMenu = '$_root/main_menu.png';
  static const String meadowHills = '$_root/meadow_hills.png';
  static const String nightSkyMoon = '$_root/night_sky_moon.png';
  static const String nightSkyMoonV2 = '$_root/night_sky_moon_v2.png';
  static const String ocean = '$_root/ocean.png';

  /// All bundled backgrounds in declaration order — handy for previews.
  static const List<String> all = [
    bg1,
    bg2,
    bg3,
    bg4,
    congrats,
    stars,
    cloudsPortrait,
    skyLandscape,
    skyPortrait,
    skyClouds,
    skyCloudsV2,
    skyMath,
    mainMenu,
    meadowHills,
    nightSkyMoon,
    nightSkyMoonV2,
    ocean,
  ];
}
