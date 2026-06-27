import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
import 'balloons_assets.dart';

/// Color variants for [GameBalloonImage] — matches the bundled balloon PNGs.
enum GameBalloon {
  blue(asset: BalloonAssets.blue),
  green(asset: BalloonAssets.green),
  purple(asset: BalloonAssets.purple),
  yellow(asset: BalloonAssets.yellow);

  const GameBalloon({required this.asset});

  /// Bundled PNG path for this balloon.
  final String asset;
}

/// Renders a bundled balloon PNG. Pass [onTap] to make it interactive
/// (wraps in [GameTapScale]).
class GameBalloonImage extends StatelessWidget {
  const GameBalloonImage({
    required this.balloon,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameBalloon balloon;

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
      balloon.asset,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
    );
    if (onTap == null) return image;
    return GameTapScale(onTap: onTap, child: image);
  }
}
