import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'streaks_assets.dart';

/// Bundled streak / combo HUD pieces — matches the PNGs in [StreakAssets].
enum GameStreak {
  cloudPlatform(asset: StreakAssets.cloudPlatform),
  islandCloudLabeled(asset: StreakAssets.islandCloudLabeled),
  progressCloud(asset: StreakAssets.progressCloud),
  coinFire(asset: StreakAssets.coinFire);

  const GameStreak({required this.asset});

  /// Bundled PNG path for this streak piece.
  final String asset;
}

/// Renders a bundled streak / combo HUD piece with an optional centered
/// [child] (e.g. the streak count). Pass [onTap] to make it interactive.
class GameStreakImage extends StatelessWidget {
  const GameStreakImage({
    required this.streak,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.child,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameStreak streak;

  /// Convenience square sizing (sets both [width] and [height]). Ignored when
  /// [width] or [height] is set explicitly.
  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;

  /// Optional centered overlay (e.g. a streak count label).
  final Widget? child;
  final String? semanticLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GameAssetImage(
      assetPath: streak.asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      onTap: onTap,
      overlay: child,
    );
  }
}
