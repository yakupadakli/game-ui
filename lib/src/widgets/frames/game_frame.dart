import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/constants.dart' show gameUiPackageName;
import 'frames_assets.dart';

/// Variant selector for [GameFrame] — matches the bundled colored PNGs.
enum GameFrameVariant {
  blue(asset: FrameAssets.blue),
  green(asset: FrameAssets.green),
  orange(asset: FrameAssets.orange),
  purple(asset: FrameAssets.purple),
  yellow(asset: FrameAssets.yellow);

  const GameFrameVariant({required this.asset});

  /// Bundled PNG path for this variant.
  final String asset;
}

/// Rounded colored frame container — paints a bundled frame PNG behind
/// [child] (via [BoxFit.fill] on a [DecorationImage]).
///
/// The frame PNG includes the rounded shape, rim shading, and outer glow, so
/// the wrapping widget doesn't need its own border. Pass [onTap] to make the
/// frame interactive (wraps in [GameTapScale]).
class GameFrame extends StatelessWidget {
  const GameFrame({
    required this.child,
    this.variant = GameFrameVariant.blue,
    this.padding = const EdgeInsets.all(16),
    this.width,
    this.height,
    this.onTap,
    super.key,
  });

  final Widget child;
  final GameFrameVariant variant;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final frame = Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(variant.asset, package: gameUiPackageName),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );

    if (onTap == null) return frame;
    return GameTapScale(onTap: onTap, child: frame);
  }
}
