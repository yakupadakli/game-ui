import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled streak / combo HUD PNGs — cloud platforms and coin-fire badges that
/// surface the player's current streak.
abstract final class StreakAssets {
  StreakAssets._();

  static const String _root = '$kGameAssetRoot/streaks';

  static const String cloudPlatform = '$_root/cloud_platform.png';
  static const String islandCloudLabeled = '$_root/island_cloud_labeled.png';
  static const String progressCloud = '$_root/progress_cloud.png';
  static const String coinFire = '$_root/coin_fire.png';

  static const List<String> all = [
    cloudPlatform,
    islandCloudLabeled,
    progressCloud,
    coinFire,
  ];
}
