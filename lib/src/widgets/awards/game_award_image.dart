import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'awards_assets.dart';

/// Bundled award illustrations — medals, trophies, badges, ribbons, and
/// presentation stars from [AwardAssets].
enum GameAward {
  medalBronze(asset: AwardAssets.medalBronze),
  medalSilver(asset: AwardAssets.medalSilver),
  medalGold(asset: AwardAssets.medalGold),
  trophyGold(asset: AwardAssets.trophyGold),
  trophyGoldStar(asset: AwardAssets.trophyGoldStar),
  trophyOutline(asset: AwardAssets.trophyOutline),
  trophyOutlineThick(asset: AwardAssets.trophyOutlineThick),
  trophyOutlineV2(asset: AwardAssets.trophyOutlineV2),
  trophyStar(asset: AwardAssets.trophyStar),
  trophyStarV2(asset: AwardAssets.trophyStarV2),
  badgeGoldPawCongrats(asset: AwardAssets.badgeGoldPawCongrats),
  badgeRedGoldStar(asset: AwardAssets.badgeRedGoldStar),
  ribbonBlueMedal(asset: AwardAssets.ribbonBlueMedal),
  starBlueGlossy(asset: AwardAssets.starBlueGlossy),
  starCoinBlueCombo(asset: AwardAssets.starCoinBlueCombo),
  starGoldFaceted(asset: AwardAssets.starGoldFaceted),
  starGoldGlossy(asset: AwardAssets.starGoldGlossy),
  starSingle(asset: AwardAssets.starSingle),
  starsTriple(asset: AwardAssets.starsTriple);

  const GameAward({required this.asset});

  /// Bundled PNG path for this award.
  final String asset;
}

/// Renders a bundled [GameAward] illustration (medal / trophy / badge / ribbon
/// / star). Pass [onTap] to make it interactive (wraps in [GameTapScale]).
class GameAwardImage extends StatelessWidget {
  const GameAwardImage({
    required this.award,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameAward award;

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
      asset: award.asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      onTap: onTap,
    );
  }
}
