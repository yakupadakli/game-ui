import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled game-themed icon paths — chunky illustrated PNGs that fit the
/// game aesthetic (rather than the flat Material icon set).
abstract final class GameIconAssets {
  GameIconAssets._();

  static const String _gameRoot = '$kGameAssetRoot/icons/game';
  static const String _commonRoot = '$kGameAssetRoot/icons/common';

  // Game / lesson context.
  static const String check = '$_gameRoot/check.png';
  static const String lightbulb = '$_gameRoot/lightbulb.png';
  static const String pencil = '$_gameRoot/pencil.png';
  static const String puzzle = '$_gameRoot/puzzle.png';
  static const String toyblocks = '$_gameRoot/toyblocks.png';

  // Generic UI / system.
  static const String bell = '$_commonRoot/bell.png';
  static const String bulb = '$_commonRoot/bulb.png';
  static const String gearMetallic = '$_commonRoot/gear_metallic.png';
  static const String lock = '$_commonRoot/lock.png';
  static const String palettePaintbrush = '$_commonRoot/palette_paintbrush.png';
  static const String ribbon = '$_commonRoot/ribbon.png';
  static const String shield = '$_commonRoot/shield.png';

  // Audio / volume.
  static const String speakerV1 = '$_commonRoot/speaker_v1.png';
  static const String speakerV2 = '$_commonRoot/speaker_v2.png';
  static const String speakerV3 = '$_commonRoot/speaker_v3.png';

  // Stars / trophies.
  static const String star = '$_commonRoot/star.png';
  static const String starV1 = '$_commonRoot/star_v1.png';
  static const String starV2 = '$_commonRoot/star_v2.png';
  static const String starWithTail = '$_commonRoot/star_with_tail.png';
  static const String trophyWithStar = '$_commonRoot/trophy_with_star.png';
}
