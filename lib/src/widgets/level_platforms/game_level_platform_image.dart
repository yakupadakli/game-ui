import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'level_platforms_assets.dart';

/// Bundled grounded-platform map nodes — matches [LevelPlatformAssets].
enum GameLevelPlatform {
  desert(asset: LevelPlatformAssets.desert),
  desertLocked(asset: LevelPlatformAssets.desertLocked),
  iceElephant(asset: LevelPlatformAssets.iceElephant),
  iceEmpty(asset: LevelPlatformAssets.iceEmpty),
  jungleFireBearTrophyEmpty(
    asset: LevelPlatformAssets.jungleFireBearTrophyEmpty,
  ),
  jungleFireBearTrophyFull(asset: LevelPlatformAssets.jungleFireBearTrophyFull),
  jungleFireBearTrophyV2(asset: LevelPlatformAssets.jungleFireBearTrophyV2),
  jungleFireOnlyStreakEmpty(
    asset: LevelPlatformAssets.jungleFireOnlyStreakEmpty,
  ),
  meadowAstronaut(asset: LevelPlatformAssets.meadowAstronaut),
  meadowEmpty(asset: LevelPlatformAssets.meadowEmpty),
  moonFireBearStreakEmpty(asset: LevelPlatformAssets.moonFireBearStreakEmpty),
  moonFireBearStreakFaded(asset: LevelPlatformAssets.moonFireBearStreakFaded),
  moonFireBearTrophy(asset: LevelPlatformAssets.moonFireBearTrophy),
  moonFireBearTrophyV2(asset: LevelPlatformAssets.moonFireBearTrophyV2),
  moonFireOnly(asset: LevelPlatformAssets.moonFireOnly),
  moonFireStreakEmpty(asset: LevelPlatformAssets.moonFireStreakEmpty),
  moonRobotBearTrophy(asset: LevelPlatformAssets.moonRobotBearTrophy),
  moonRobotTrophy(asset: LevelPlatformAssets.moonRobotTrophy),
  stoneCrystalPurple(asset: LevelPlatformAssets.stoneCrystalPurple),
  volcano(asset: LevelPlatformAssets.volcano),
  volcanoAutumn(asset: LevelPlatformAssets.volcanoAutumn);

  const GameLevelPlatform({required this.asset});

  /// Bundled PNG path for this platform.
  final String asset;
}

/// Renders a bundled [GameLevelPlatform] map node. Pass [onTap] to make it
/// interactive (wraps in [GameAssetImage]).
class GameLevelPlatformImage extends StatelessWidget {
  const GameLevelPlatformImage({
    required this.platform,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameLevelPlatform platform;

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
      assetPath: platform.asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      onTap: onTap,
    );
  }
}
