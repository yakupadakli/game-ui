import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled level-map platform PNGs — grounded biome platforms used as map
/// nodes (empty / locked / character / trophy / streak states).
abstract final class LevelPlatformAssets {
  LevelPlatformAssets._();

  static const String _root = '$kGameAssetRoot/level_platforms';

  // Desert.
  static const String desert = '$_root/desert.png';
  static const String desertLocked = '$_root/desert_locked.png';

  // Ice.
  static const String iceElephant = '$_root/ice_elephant.png';
  static const String iceEmpty = '$_root/ice_empty.png';

  // Jungle.
  static const String jungleFireBearTrophyEmpty =
      '$_root/jungle_fire_bear_trophy_empty.png';
  static const String jungleFireBearTrophyFull =
      '$_root/jungle_fire_bear_trophy_full.png';
  static const String jungleFireBearTrophyV2 =
      '$_root/jungle_fire_bear_trophy_v2.png';
  static const String jungleFireOnlyStreakEmpty =
      '$_root/jungle_fire_only_streak_empty.png';

  // Meadow.
  static const String meadowAstronaut = '$_root/meadow_astronaut.png';
  static const String meadowEmpty = '$_root/meadow_empty.png';

  // Moon.
  static const String moonFireBearStreakEmpty =
      '$_root/moon_fire_bear_streak_empty.png';
  static const String moonFireBearStreakFaded =
      '$_root/moon_fire_bear_streak_faded.png';
  static const String moonFireBearTrophy = '$_root/moon_fire_bear_trophy.png';
  static const String moonFireBearTrophyV2 =
      '$_root/moon_fire_bear_trophy_v2.png';
  static const String moonFireOnly = '$_root/moon_fire_only.png';
  static const String moonFireStreakEmpty = '$_root/moon_fire_streak_empty.png';
  static const String moonRobotBearTrophy = '$_root/moon_robot_bear_trophy.png';
  static const String moonRobotTrophy = '$_root/moon_robot_trophy.png';

  // Stone / volcano.
  static const String stoneCrystalPurple = '$_root/stone_crystal_purple.png';
  static const String volcano = '$_root/volcano.png';
  static const String volcanoAutumn = '$_root/volcano_autumn.png';

  static const List<String> all = [
    desert,
    desertLocked,
    iceElephant,
    iceEmpty,
    jungleFireBearTrophyEmpty,
    jungleFireBearTrophyFull,
    jungleFireBearTrophyV2,
    jungleFireOnlyStreakEmpty,
    meadowAstronaut,
    meadowEmpty,
    moonFireBearStreakEmpty,
    moonFireBearStreakFaded,
    moonFireBearTrophy,
    moonFireBearTrophyV2,
    moonFireOnly,
    moonFireStreakEmpty,
    moonRobotBearTrophy,
    moonRobotTrophy,
    stoneCrystalPurple,
    volcano,
    volcanoAutumn,
  ];
}
