import 'package:flutter/material.dart';

import '../../core/game_design_tokens.dart';

/// Rounded white card with a thick game-style border + soft drop shadow.
/// Holds a free-form [child] (e.g. math expression, prompt, illustration),
/// with an optional [bottom] slot beneath it (e.g. input display, buttons)
/// and an optional [mascot] floating off the left edge — the classic
/// "character peeks out of the speech bubble" composition.
///
/// Defaults match the math-game card: white face, soft slate border, 16px
/// outer padding, shadow offset (0, 10).
class GameContentCard extends StatelessWidget {
  const GameContentCard({
    required this.child,
    this.mascot,
    this.bottom,
    this.color = Colors.white,
    this.borderColor = const Color(0xFFB7C8D9),
    this.shadowColor = Colors.black,
    this.borderRadius = GameDesignTokens.radiusLG,
    this.borderWidth = 3.0,
    this.mascotLeft = -30.0,
    this.mascotBottom = 19.0,
    this.mascotBottomWithBottomSlot = 75.0,
    this.height = 120.0,
    this.bottomSlotHeight = 70.0,
    this.outerPadding = const EdgeInsets.symmetric(
      horizontal: GameDesignTokens.spacingXL,
      vertical: GameDesignTokens.spacingSM,
    ),
    this.innerPadding = GameDesignTokens.spacingLG,
    super.key,
  });

  final Widget child;
  final Widget? mascot;
  final Widget? bottom;
  final Color color;
  final Color borderColor;
  final Color shadowColor;
  final double borderRadius;
  final double borderWidth;
  final double mascotLeft;
  final double mascotBottom;
  final double mascotBottomWithBottomSlot;
  final double height;
  final double bottomSlotHeight;
  final EdgeInsetsGeometry outerPadding;
  final double innerPadding;

  double get _cardHeight => height + (bottom != null ? bottomSlotHeight : 0);

  double get _effectiveMascotBottom =>
      bottom != null ? mascotBottomWithBottomSlot : mascotBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: SizedBox(
        width: double.infinity,
        height: _cardHeight + GameDesignTokens.spacingMD * 2,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: GameDesignTokens.spacingMD,
              bottom: GameDesignTokens.spacingMD,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: borderColor, width: borderWidth),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor.withValues(alpha: 0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: mascot != null ? 100.0 : innerPadding,
                          right: innerPadding,
                        ),
                        child: Center(child: child),
                      ),
                    ),
                    if (bottom != null) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: innerPadding),
                        child: bottom!,
                      ),
                      const SizedBox(height: GameDesignTokens.spacingMD),
                    ],
                  ],
                ),
              ),
            ),
            if (mascot != null)
              Positioned(
                left: mascotLeft,
                bottom: _effectiveMascotBottom,
                child: mascot!,
              ),
          ],
        ),
      ),
    );
  }
}
