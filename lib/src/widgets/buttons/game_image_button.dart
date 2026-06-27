import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
import 'buttons_assets.dart';

/// Bundled button-background styles — matches the PNGs in [ButtonAssets].
enum GameImageButtonStyle {
  blue(asset: ButtonAssets.blue),
  green(asset: ButtonAssets.green),
  purple(asset: ButtonAssets.purple),
  red(asset: ButtonAssets.red),
  circleBlueGlossy(asset: ButtonAssets.circleBlueGlossy),
  circleWhiteGlossy(asset: ButtonAssets.circleWhiteGlossy),
  squareBlueGlossy(asset: ButtonAssets.squareBlueGlossy),
  squareGreenGlossy(asset: ButtonAssets.squareGreenGlossy),
  squareOrangeGlossy(asset: ButtonAssets.squareOrangeGlossy),
  squareRedGlossy(asset: ButtonAssets.squareRedGlossy),
  orangeEmpty(asset: ButtonAssets.orangeEmpty),
  orangePlay(asset: ButtonAssets.orangePlay),
  orangeWithDot(asset: ButtonAssets.orangeWithDot),
  outlineWhite(asset: ButtonAssets.outlineWhite);

  const GameImageButtonStyle({required this.asset});

  /// Bundled PNG path for this button background.
  final String asset;
}

/// Tappable button backed by a bundled button PNG, with an optional [child]
/// (label / icon) centered on top. Press feedback comes from [GameTapScale].
///
/// The PNG defines the size; pass [width] and/or [height] to scale it.
class GameImageButton extends StatelessWidget {
  const GameImageButton({
    this.style = GameImageButtonStyle.blue,
    this.onTap,
    this.child,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.padding = EdgeInsets.zero,
    this.semanticLabel,
    super.key,
  });

  final GameImageButtonStyle style;
  final VoidCallback? onTap;

  /// Centered overlay content (label / icon). Omit for art that already
  /// carries its glyph (e.g. [GameImageButtonStyle.orangePlay]).
  final Widget? child;
  final double? width;
  final double? height;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final content = Stack(
      alignment: Alignment.center,
      children: [
        GameUiImage.asset(
          style.asset,
          width: width,
          height: height,
          fit: fit,
          semanticLabel: semanticLabel,
        ),
        if (child != null) Padding(padding: padding, child: child),
      ],
    );
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }
}
