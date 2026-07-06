import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'currencies_assets.dart';

/// Bundled coin / currency tokens — matches the PNGs in [CurrencyAssets].
enum GameCoin {
  star(asset: CurrencyAssets.coinStar),
  stackGold(asset: CurrencyAssets.coinsStackGold),
  goldStarDouble(asset: CurrencyAssets.coinGoldStarDouble);

  const GameCoin({required this.asset});

  /// Bundled PNG path for this coin.
  final String asset;
}

/// Renders a bundled coin / currency PNG. Pass [onTap] to make it interactive
/// (wraps in [GameAssetImage]).
class GameCoinImage extends StatelessWidget {
  const GameCoinImage({
    required this.coin,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameCoin coin;

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
      assetPath: coin.asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      onTap: onTap,
    );
  }
}
