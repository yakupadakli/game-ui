import 'package:flutter/painting.dart';

import 'game_colors.dart';
import 'game_design_tokens.dart';

/// Shared typography scale for game-style widgets.
///
/// Every style points at [GameDesignTokens.fontFamily] (`Fredoka`). When the
/// font file is not bundled yet, Flutter falls back to the platform default —
/// styles still resolve, sizes/weights stay correct.
abstract final class GameTextStyles {
  GameTextStyles._();

  static const TextStyle heading1 = TextStyle(
    fontFamily: GameDesignTokens.fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: GameDesignTokens.font3XL,
    color: GameColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: GameDesignTokens.fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: GameDesignTokens.font2XL,
    color: GameColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle body = TextStyle(
    fontFamily: GameDesignTokens.fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: GameDesignTokens.fontLG,
    color: GameColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodyBold = TextStyle(
    fontFamily: GameDesignTokens.fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: GameDesignTokens.fontLG,
    color: GameColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontFamily: GameDesignTokens.fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: GameDesignTokens.fontXL,
    color: GameColors.textOnPrimary,
    height: 1.0,
  );
}
