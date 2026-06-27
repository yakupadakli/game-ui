import 'package:flutter/widgets.dart';

import '../../core/constants.dart' show gameUiPackageName;
import '../../core/game_design_tokens.dart';
import 'panels_assets.dart';

/// Paints the bundled answer speech-bubble PNG behind [child]. The bubble art
/// includes the rounded shape and tail, so the wrapper adds no border.
class GameSpeechBubble extends StatelessWidget {
  const GameSpeechBubble({
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: GameDesignTokens.spacingLG,
      vertical: GameDesignTokens.spacingMD,
    ),
    this.width,
    this.height,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            PanelAssets.bubbleAnswer,
            package: gameUiPackageName,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
