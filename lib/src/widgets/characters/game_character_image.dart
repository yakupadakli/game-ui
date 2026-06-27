import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
import 'characters_assets.dart';

/// Bundled full-body scene characters — matches the PNGs in [CharacterAssets].
enum GameCharacter {
  astronaut(asset: CharacterAssets.astronaut),
  astronautGirl(asset: CharacterAssets.astronautGirl),
  astronautMagicIsland(asset: CharacterAssets.astronautMagicIsland),
  bearQuizIsland(asset: CharacterAssets.bearQuizIsland),
  bearRunningBackpack(asset: CharacterAssets.bearRunningBackpack),
  bearAddition(asset: CharacterAssets.bearAddition),
  elephant(asset: CharacterAssets.elephant),
  elephantQuizIsland(asset: CharacterAssets.elephantQuizIsland),
  fire(asset: CharacterAssets.fire),
  fireV2(asset: CharacterAssets.fireV2),
  fireMascot(asset: CharacterAssets.fireMascot),
  fireMascotSheet(asset: CharacterAssets.fireMascotSheet),
  foxQuizIsland(asset: CharacterAssets.foxQuizIsland),
  foxQuizIslandV2(asset: CharacterAssets.foxQuizIslandV2),
  foxRunningCape(asset: CharacterAssets.foxRunningCape),
  foxRunningMultiply(asset: CharacterAssets.foxRunningMultiply),
  foxMultiplication(asset: CharacterAssets.foxMultiplication),
  penguinQuizIsland(asset: CharacterAssets.penguinQuizIsland),
  penguinQuizV2(asset: CharacterAssets.penguinQuizV2),
  group(asset: CharacterAssets.group);

  const GameCharacter({required this.asset});

  /// Bundled PNG path for this character.
  final String asset;
}

/// Renders a bundled [GameCharacter] illustration. Pass [onTap] to make it
/// interactive (wraps in [GameTapScale]) — handy for character pickers.
class GameCharacterImage extends StatelessWidget {
  const GameCharacterImage({
    required this.character,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameCharacter character;

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
    final image = GameUiImage.asset(
      character.asset,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
    );
    if (onTap == null) return image;
    return GameTapScale(onTap: onTap, child: image);
  }
}
