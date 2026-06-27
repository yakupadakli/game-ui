import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
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
    final image = GameUiImage.asset(
      streak.asset,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
    );
    final content = child == null
        ? image
        : Stack(alignment: Alignment.center, children: [image, child!]);
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }
}
