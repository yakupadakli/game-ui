import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'decorations_assets.dart';

/// Ambient scenery decorations — clouds and flowers from [DecorationAssets].
enum GameDecoration {
  cloud(asset: DecorationAssets.cloud),
  cloudPartlySunny(asset: DecorationAssets.cloudPartlySunny),
  cloudRain(asset: DecorationAssets.cloudRain),
  cloudDecoration(asset: DecorationAssets.cloudDecoration),
  flowerBlue(asset: DecorationAssets.flowerBlue),
  flowerRed(asset: DecorationAssets.flowerRed),
  flowerYellow(asset: DecorationAssets.flowerYellow);

  const GameDecoration({required this.asset});

  /// Bundled PNG path for this decoration.
  final String asset;
}

/// Renders a bundled decorative PNG (cloud / flower). Decorations are excluded
/// from semantics by default since they're ambient scenery; pass a
/// [semanticLabel] to surface one.
class GameDecorationImage extends StatelessWidget {
  const GameDecorationImage({
    required this.decoration,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    super.key,
  });

  final GameDecoration decoration;

  /// Convenience square sizing (sets both [width] and [height]). Ignored when
  /// [width] or [height] is set explicitly.
  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return GameAssetImage(
      assetPath: decoration.asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
    );
  }
}
