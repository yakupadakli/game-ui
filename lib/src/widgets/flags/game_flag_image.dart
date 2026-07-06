import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'flags_assets.dart';

/// Color variants for [GameFlagImage] — matches the bundled flag PNGs.
enum GameFlag {
  blue(asset: FlagAssets.blue),
  green(asset: FlagAssets.green),
  pink(asset: FlagAssets.pink),
  purple(asset: FlagAssets.purple);

  const GameFlag({required this.asset});

  /// Bundled PNG path for this flag.
  final String asset;
}

/// Renders a bundled checkpoint / goal flag PNG. Pass [onTap] to make it
/// interactive (wraps in [GameAssetImage]).
class GameFlagImage extends StatelessWidget {
  const GameFlagImage({
    required this.flag,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameFlag flag;

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
      assetPath: flag.asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      onTap: onTap,
    );
  }
}
