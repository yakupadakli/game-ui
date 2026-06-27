import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
import 'items_assets.dart';

/// Bundled collectible items — matches the PNGs in [ItemAssets].
enum GameItem {
  jarBlue(asset: ItemAssets.jarBlue),
  keyGold(asset: ItemAssets.keyGold),
  keyGolden(asset: ItemAssets.keyGolden),
  magicScrollDiamond(asset: ItemAssets.magicScrollDiamond),
  rockCrystalTeal(asset: ItemAssets.rockCrystalTeal),
  scrollMagic(asset: ItemAssets.scrollMagic),
  snowball(asset: ItemAssets.snowball);

  const GameItem({required this.asset});

  /// Bundled PNG path for this item.
  final String asset;
}

/// Renders a bundled [GameItem] prop. Pass [onTap] to make it interactive
/// (wraps in [GameTapScale]).
class GameItemImage extends StatelessWidget {
  const GameItemImage({
    required this.item,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameItem item;

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
      item.asset,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
    );
    if (onTap == null) return image;
    return GameTapScale(onTap: onTap, child: image);
  }
}
