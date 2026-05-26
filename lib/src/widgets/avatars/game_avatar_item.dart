import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Selectable circular avatar item — wraps a [child] (mascot, illustration,
/// icon) with a tap target, scale-up + glow when [isSelected], and an
/// optional check badge at the bottom.
///
/// Generic: works with any widget child. Use for avatar pickers, character
/// selection, settings rows where the user taps one of several options.
class GameAvatarItem extends StatelessWidget {
  const GameAvatarItem({
    required this.child,
    required this.isSelected,
    required this.onTap,
    this.glowColor = GameColors.primary,
    this.selectedScale = 1.2,
    this.unselectedScale = 1.0,
    this.glowSize = 120.0,
    this.showCheck = true,
    this.animationDuration = const Duration(milliseconds: 200),
    super.key,
  });

  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;
  final Color glowColor;
  final double selectedScale;
  final double unselectedScale;
  final double glowSize;
  final bool showCheck;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? selectedScale : unselectedScale,
        duration: animationDuration,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isSelected)
              Container(
                width: glowSize,
                height: glowSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: glowColor.withValues(alpha: 0.6),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
              ),
            child,
            if (isSelected && showCheck)
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GameDesignTokens.spacingSM,
                    vertical: GameDesignTokens.spacingXS / 2,
                  ),
                  decoration: BoxDecoration(
                    color: glowColor,
                    borderRadius: BorderRadius.circular(
                      GameDesignTokens.radiusMD,
                    ),
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
