import '../../core/constants.dart' show kGameAssetRoot;
import 'game_mascot.dart';

/// Bundled asset paths for [GameMascot] characters.
///
/// Use [pathFor] to resolve a `(mascot, pose)` combination, or read the
/// per-character constants directly when you want a single specific pose.
abstract final class MascotAssets {
  MascotAssets._();

  static const String _root = '$kGameAssetRoot/mascots';

  /// Returns the bundled PNG path for [mascot] in [pose].
  static String pathFor(GameMascot mascot, GameMascotPose pose) {
    return '$_root/${mascot.folderName}/${mascot.name}_${pose.name}.png';
  }

  /// Returns the bundled PNG path for a bear-only [pose] (see [GameBearPose]).
  static String bearPath(GameBearPose pose) {
    return '$_root/${GameMascot.bear.folderName}/${pose.file}.png';
  }

  // Bear
  static const String bearAngry = '$_root/bears/bear_angry.png';
  static const String bearCongrats = '$_root/bears/bear_congrats.png';
  static const String bearConstruction = '$_root/bears/bear_construction.png';
  static const String bearCurious = '$_root/bears/bear_curious.png';
  static const String bearHead = '$_root/bears/bear_head.png';
  static const String bearHero = '$_root/bears/bear_hero.png';
  static const String bearPointing = '$_root/bears/bear_pointing.png';
  static const String bearSitting = '$_root/bears/bear_sitting.png';
  static const String bearStar = '$_root/bears/bear_star.png';
  static const String bearThinking = '$_root/bears/bear_thinking.png';
  static const String bearWriting = '$_root/bears/bear_writing.png';

  // Elephant
  static const String elephantAngry = '$_root/elephants/elephant_angry.png';
  static const String elephantCongrats =
      '$_root/elephants/elephant_congrats.png';
  static const String elephantConstruction =
      '$_root/elephants/elephant_construction.png';
  static const String elephantCurious = '$_root/elephants/elephant_curious.png';
  static const String elephantHead = '$_root/elephants/elephant_head.png';
  static const String elephantHero = '$_root/elephants/elephant_hero.png';
  static const String elephantPointing =
      '$_root/elephants/elephant_pointing.png';
  static const String elephantSitting = '$_root/elephants/elephant_sitting.png';
  static const String elephantStar = '$_root/elephants/elephant_star.png';
  static const String elephantThinking =
      '$_root/elephants/elephant_thinking.png';
  static const String elephantWriting = '$_root/elephants/elephant_writing.png';

  // Fox
  static const String foxAngry = '$_root/foxes/fox_angry.png';
  static const String foxCongrats = '$_root/foxes/fox_congrats.png';
  static const String foxConstruction = '$_root/foxes/fox_construction.png';
  static const String foxCurious = '$_root/foxes/fox_curious.png';
  static const String foxHead = '$_root/foxes/fox_head.png';
  static const String foxHero = '$_root/foxes/fox_hero.png';
  static const String foxPointing = '$_root/foxes/fox_pointing.png';
  static const String foxSitting = '$_root/foxes/fox_sitting.png';
  static const String foxStar = '$_root/foxes/fox_star.png';
  static const String foxThinking = '$_root/foxes/fox_thinking.png';
  static const String foxWriting = '$_root/foxes/fox_writing.png';

  // Penguin
  static const String penguinAngry = '$_root/penguins/penguin_angry.png';
  static const String penguinCongrats = '$_root/penguins/penguin_congrats.png';
  static const String penguinConstruction =
      '$_root/penguins/penguin_construction.png';
  static const String penguinCurious = '$_root/penguins/penguin_curious.png';
  static const String penguinHead = '$_root/penguins/penguin_head.png';
  static const String penguinHero = '$_root/penguins/penguin_hero.png';
  static const String penguinPointing = '$_root/penguins/penguin_pointing.png';
  static const String penguinSitting = '$_root/penguins/penguin_sitting.png';
  static const String penguinStar = '$_root/penguins/penguin_star.png';
  static const String penguinThinking = '$_root/penguins/penguin_thinking.png';
  static const String penguinWriting = '$_root/penguins/penguin_writing.png';
}
