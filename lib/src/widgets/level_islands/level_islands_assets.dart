import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled level-map island PNGs — floating themed islands used as map nodes
/// (empty / locked / character / reward states across biomes).
abstract final class LevelIslandAssets {
  LevelIslandAssets._();

  static const String _root = '$kGameAssetRoot/level_islands';

  // Operation-themed scene islands.
  static const String bearAddition = '$_root/bear_addition.png';
  static const String bearAdditionFlowers = '$_root/bear_addition_flowers.png';
  static const String elephantDivision = '$_root/elephant_division.png';
  static const String foxMultiplication = '$_root/fox_multiplication.png';
  static const String penguinSubtraction = '$_root/penguin_subtraction.png';
  static const String sceneAddition = '$_root/scene_addition.png';
  static const String volcanoSubtraction = '$_root/volcano_subtraction.png';
  static const String bearIslandAddition = '$_root/bear_island_addition.png';
  static const String bearIslandSign = '$_root/bear_island_sign.png';
  static const String additionEmpty = '$_root/addition_empty.png';
  static const String additionWithBear = '$_root/addition_with_bear.png';

  // Astronaut math-board islands.
  static const String astronautMathBoard = '$_root/astronaut_math_board.png';
  static const String astronautMathBoardV2 =
      '$_root/astronaut_math_board_v2.png';
  static const String astronautMathBoardV3 =
      '$_root/astronaut_math_board_v3.png';
  static const String astronautMathBoardV4 =
      '$_root/astronaut_math_board_v4.png';

  // Biome islands.
  static const String autumnEmptyV1 = '$_root/autumn_empty_v1.png';
  static const String autumnEmptyV2 = '$_root/autumn_empty_v2.png';
  static const String autumnPenguin = '$_root/autumn_penguin.png';
  static const String desertEmpty = '$_root/desert_empty.png';
  static const String desertFox = '$_root/desert_fox.png';
  static const String desertLocked = '$_root/desert_locked.png';
  static const String empty = '$_root/empty.png';
  static const String fox = '$_root/fox.png';
  static const String grassBear = '$_root/grass_bear.png';
  static const String grassTwoChars = '$_root/grass_two_chars.png';
  static const String iceDivide = '$_root/ice_divide.png';
  static const String iceElephant = '$_root/ice_elephant.png';
  static const String lavaEmpty = '$_root/lava_empty.png';
  static const String lavaFire = '$_root/lava_fire.png';
  static const String mountainEmpty = '$_root/mountain_empty.png';
  static const String mountainPlus = '$_root/mountain_plus.png';

  // Notebook / math-board islands.
  static const String bearMagicNotebook = '$_root/bear_magic_notebook.png';
  static const String bearMathBoard = '$_root/bear_math_board.png';
  static const String elephantMagicNotebook =
      '$_root/elephant_magic_notebook.png';
  static const String foxMagicNotebook = '$_root/fox_magic_notebook.png';
  static const String foxMagicNotebookV2 = '$_root/fox_magic_notebook_v2.png';
  static const String foxMathBoard = '$_root/fox_math_board.png';
  static const String penguinMagicNotebook =
      '$_root/penguin_magic_notebook.png';
  static const String penguinMagicNotebookV2 =
      '$_root/penguin_magic_notebook_v2.png';
  static const String penguinMathBoard = '$_root/penguin_math_board.png';

  // Reward / treasure islands.
  static const String caveCoins = '$_root/cave_coins.png';
  static const String cloudChest = '$_root/cloud_chest.png';
  static const String crystalBlue = '$_root/crystal_blue.png';
  static const String mathTree = '$_root/math_tree.png';
  static const String mathTreeV2 = '$_root/math_tree_v2.png';
  static const String mineEmpty = '$_root/mine_empty.png';
  static const String mineWithOwl = '$_root/mine_with_owl.png';
  static const String mineWithOwlV2 = '$_root/mine_with_owl_v2.png';
  static const String treasureChest = '$_root/treasure_chest.png';
  static const String treasureChestV2 = '$_root/treasure_chest_v2.png';
  static const String trophyMedals = '$_root/trophy_medals.png';
  static const String trophyScore = '$_root/trophy_score.png';

  static const List<String> all = [
    bearAddition,
    bearAdditionFlowers,
    elephantDivision,
    foxMultiplication,
    penguinSubtraction,
    sceneAddition,
    volcanoSubtraction,
    bearIslandAddition,
    bearIslandSign,
    additionEmpty,
    additionWithBear,
    astronautMathBoard,
    astronautMathBoardV2,
    astronautMathBoardV3,
    astronautMathBoardV4,
    autumnEmptyV1,
    autumnEmptyV2,
    autumnPenguin,
    desertEmpty,
    desertFox,
    desertLocked,
    empty,
    fox,
    grassBear,
    grassTwoChars,
    iceDivide,
    iceElephant,
    lavaEmpty,
    lavaFire,
    mountainEmpty,
    mountainPlus,
    bearMagicNotebook,
    bearMathBoard,
    elephantMagicNotebook,
    foxMagicNotebook,
    foxMagicNotebookV2,
    foxMathBoard,
    penguinMagicNotebook,
    penguinMagicNotebookV2,
    penguinMathBoard,
    caveCoins,
    cloudChest,
    crystalBlue,
    mathTree,
    mathTreeV2,
    mineEmpty,
    mineWithOwl,
    mineWithOwlV2,
    treasureChest,
    treasureChestV2,
    trophyMedals,
    trophyScore,
  ];
}
