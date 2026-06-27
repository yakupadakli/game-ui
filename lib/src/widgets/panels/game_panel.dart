import 'package:flutter/widgets.dart';

import '../../core/constants.dart' show gameUiPackageName;
import '../../core/game_design_tokens.dart';
import 'panels_assets.dart';

/// Framed-panel variants for [GamePanel] — matches the bundled panel PNGs.
enum GamePanelVariant {
  cardBlue(asset: PanelAssets.cardBlue),
  answerBox(asset: PanelAssets.answerBoxBlue),
  woodBoard(asset: PanelAssets.woodBoardVine);

  const GamePanelVariant({required this.asset});

  /// Bundled PNG path for this panel.
  final String asset;
}

/// Paints a bundled framed-panel PNG behind [child] (via [BoxFit.fill] on a
/// [DecorationImage]) — answer boxes, blue cards, wooden boards. The PNG
/// carries the shape and rim, so the wrapper needs no border of its own.
class GamePanel extends StatelessWidget {
  const GamePanel({
    required this.child,
    this.variant = GamePanelVariant.cardBlue,
    this.padding = const EdgeInsets.all(GameDesignTokens.spacingLG),
    this.width,
    this.height,
    super.key,
  });

  final Widget child;
  final GamePanelVariant variant;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}
