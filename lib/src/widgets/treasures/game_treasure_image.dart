import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
import 'treasures_assets.dart';

/// Bundled treasure-chest illustrations — matches the PNGs in [TreasureAssets].
enum GameTreasure {
  chest(asset: TreasureAssets.chest),
  closedGold(asset: TreasureAssets.closedGold),
  closedSilver(asset: TreasureAssets.closedSilver),
  chestClosed(asset: TreasureAssets.chestClosed),
  openCoinsGold(asset: TreasureAssets.openCoinsGold),
  openGlowGold(asset: TreasureAssets.openGlowGold),
  openStarsSilver(asset: TreasureAssets.openStarsSilver),
  chestOpenGems(asset: TreasureAssets.chestOpenGems);

  const GameTreasure({required this.asset});

  /// Bundled PNG path for this chest.
  final String asset;
}

/// Renders a bundled treasure-chest PNG. Pass [onTap] to make it interactive
/// (wraps in [GameTapScale]) — e.g. tap-to-open reward chests.
class GameTreasureImage extends StatelessWidget {
  const GameTreasureImage({
    required this.treasure,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameTreasure treasure;

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
      treasure.asset,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
    );
    if (onTap == null) return image;
    return GameTapScale(onTap: onTap, child: image);
  }
}
