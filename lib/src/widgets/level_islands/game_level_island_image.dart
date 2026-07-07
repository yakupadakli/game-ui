import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'level_islands_assets.dart';

/// Bundled floating-island map nodes — matches the PNGs in [LevelIslandAssets].
enum GameLevelIsland {
  bearAddition(asset: LevelIslandAssets.bearAddition),
  bearAdditionFlowers(asset: LevelIslandAssets.bearAdditionFlowers),
  elephantDivision(asset: LevelIslandAssets.elephantDivision),
  foxMultiplication(asset: LevelIslandAssets.foxMultiplication),
  penguinSubtraction(asset: LevelIslandAssets.penguinSubtraction),
  sceneAddition(asset: LevelIslandAssets.sceneAddition),
  volcanoSubtraction(asset: LevelIslandAssets.volcanoSubtraction),
  bearIslandAddition(asset: LevelIslandAssets.bearIslandAddition),
  bearIslandSign(asset: LevelIslandAssets.bearIslandSign),
  additionEmpty(asset: LevelIslandAssets.additionEmpty),
  additionWithBear(asset: LevelIslandAssets.additionWithBear),
  astronautMathBoard(asset: LevelIslandAssets.astronautMathBoard),
  astronautMathBoardV2(asset: LevelIslandAssets.astronautMathBoardV2),
  astronautMathBoardV3(asset: LevelIslandAssets.astronautMathBoardV3),
  astronautMathBoardV4(asset: LevelIslandAssets.astronautMathBoardV4),
  autumnEmptyV1(asset: LevelIslandAssets.autumnEmptyV1),
  autumnEmptyV2(asset: LevelIslandAssets.autumnEmptyV2),
  autumnPenguin(asset: LevelIslandAssets.autumnPenguin),
  desertEmpty(asset: LevelIslandAssets.desertEmpty),
  desertFox(asset: LevelIslandAssets.desertFox),
  desertLocked(asset: LevelIslandAssets.desertLocked),
  empty(asset: LevelIslandAssets.empty),
  fox(asset: LevelIslandAssets.fox),
  grassBear(asset: LevelIslandAssets.grassBear),
  grassTwoChars(asset: LevelIslandAssets.grassTwoChars),
  iceDivide(asset: LevelIslandAssets.iceDivide),
  iceElephant(asset: LevelIslandAssets.iceElephant),
  lavaEmpty(asset: LevelIslandAssets.lavaEmpty),
  lavaFire(asset: LevelIslandAssets.lavaFire),
  mountainEmpty(asset: LevelIslandAssets.mountainEmpty),
  mountainPlus(asset: LevelIslandAssets.mountainPlus),
  bearMagicNotebook(asset: LevelIslandAssets.bearMagicNotebook),
  bearMathBoard(asset: LevelIslandAssets.bearMathBoard),
  elephantMagicNotebook(asset: LevelIslandAssets.elephantMagicNotebook),
  foxMagicNotebook(asset: LevelIslandAssets.foxMagicNotebook),
  foxMagicNotebookV2(asset: LevelIslandAssets.foxMagicNotebookV2),
  foxMathBoard(asset: LevelIslandAssets.foxMathBoard),
  penguinMagicNotebook(asset: LevelIslandAssets.penguinMagicNotebook),
  penguinMagicNotebookV2(asset: LevelIslandAssets.penguinMagicNotebookV2),
  penguinMathBoard(asset: LevelIslandAssets.penguinMathBoard),
  caveCoins(asset: LevelIslandAssets.caveCoins),
  cloudChest(asset: LevelIslandAssets.cloudChest),
  crystalBlue(asset: LevelIslandAssets.crystalBlue),
  mathTree(asset: LevelIslandAssets.mathTree),
  mathTreeV2(asset: LevelIslandAssets.mathTreeV2),
  mineEmpty(asset: LevelIslandAssets.mineEmpty),
  mineWithOwl(asset: LevelIslandAssets.mineWithOwl),
  mineWithOwlV2(asset: LevelIslandAssets.mineWithOwlV2),
  treasureChest(asset: LevelIslandAssets.treasureChest),
  treasureChestV2(asset: LevelIslandAssets.treasureChestV2),
  trophyMedals(asset: LevelIslandAssets.trophyMedals),
  trophyScore(asset: LevelIslandAssets.trophyScore);

  const GameLevelIsland({required this.asset});

  /// Bundled PNG path for this island.
  final String asset;
}

/// Renders a bundled [GameLevelIsland] map node. Pass [onTap] to make it
/// interactive (wraps in [GameTapScale]) — e.g. selecting a level on a map.
class GameLevelIslandImage extends StatelessWidget {
  const GameLevelIslandImage({
    required this.island,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameLevelIsland island;

  /// Convenience square sizing (sets both [width] and [height]). Ignored when
  /// [width] or [height] is set explicitly.
  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GameAssetImage(
      asset: island.asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      onTap: onTap,
    );
  }
}
