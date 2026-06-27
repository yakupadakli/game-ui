import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled full-body character PNGs — scene mascots (astronaut, animals, fire)
/// used as hero illustrations, level guides, and reward characters.
abstract final class CharacterAssets {
  CharacterAssets._();

  static const String _root = '$kGameAssetRoot/characters';

  // Astronauts.
  static const String astronaut = '$_root/astronaut.png';
  static const String astronautGirl = '$_root/astronaut_girl.png';
  static const String astronautMagicIsland =
      '$_root/astronaut_magic_island.png';

  // Bear.
  static const String bearQuizIsland = '$_root/bear_quiz_island.png';
  static const String bearRunningBackpack = '$_root/bear_running_backpack.png';
  static const String bearAddition = '$_root/bear_addition.png';

  // Elephant.
  static const String elephant = '$_root/elephant.png';
  static const String elephantQuizIsland = '$_root/elephant_quiz_island.png';

  // Fire.
  static const String fire = '$_root/fire.png';
  static const String fireV2 = '$_root/fire_v2.png';
  static const String fireMascot = '$_root/fire_mascot.png';
  static const String fireMascotSheet = '$_root/fire_mascot_sheet.png';

  // Fox.
  static const String foxQuizIsland = '$_root/fox_quiz_island.png';
  static const String foxQuizIslandV2 = '$_root/fox_quiz_island_v2.png';
  static const String foxRunningCape = '$_root/fox_running_cape.png';
  static const String foxRunningMultiply = '$_root/fox_running_multiply.png';
  static const String foxMultiplication = '$_root/fox_multiplication.png';

  // Penguin.
  static const String penguinQuizIsland = '$_root/penguin_quiz_island.png';
  static const String penguinQuizV2 = '$_root/penguin_quiz_v2.png';

  // Group.
  static const String group = '$_root/group.png';

  static const List<String> all = [
    astronaut,
    astronautGirl,
    astronautMagicIsland,
    bearQuizIsland,
    bearRunningBackpack,
    bearAddition,
    elephant,
    elephantQuizIsland,
    fire,
    fireV2,
    fireMascot,
    fireMascotSheet,
    foxQuizIsland,
    foxQuizIslandV2,
    foxRunningCape,
    foxRunningMultiply,
    foxMultiplication,
    penguinQuizIsland,
    penguinQuizV2,
    group,
  ];
}
