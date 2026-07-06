import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Named default height for [GameTabBar] (logical pixels). [height] also
/// accepts any raw number; this is the recommended default.
abstract final class GameTabBarSize {
  GameTabBarSize._();

  static const double height = 44;
}

/// Rounded pill tab bar — a row of equal-width tabs with an animated active
/// pill that morphs between selections.
///
/// State is owned by the parent: pass [currentIndex] and react to taps via
/// [onChanged]. Each tab label gets equal horizontal space; active tab fills
/// with [activeColor], inactive labels use [inactiveColor].
class GameTabBar extends StatelessWidget {
  const GameTabBar({
    required this.labels,
    required this.currentIndex,
    required this.onChanged,
    this.activeColor = GameColors.primary,
    this.inactiveColor = GameColors.textMuted,
    this.backgroundColor = const Color(0xFFF0F2F5),
    this.height = GameTabBarSize.height,
    this.animationDuration = const Duration(milliseconds: 220),
    super.key,
  });

  final List<String> labels;
  final int currentIndex;
  final ValueChanged<int> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final double height;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(GameDesignTokens.radiusPill),
      ),
      child: Row(
        children: List.generate(labels.length, (index) {
          final isActive = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isActive ? activeColor : const Color(0x00000000),
                  borderRadius: BorderRadius.circular(
                    GameDesignTokens.radiusPill,
                  ),
                ),
                alignment: Alignment.center,
                child: AnimatedDefaultTextStyle(
                  duration: animationDuration,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isActive ? const Color(0xFFFFFFFF) : inactiveColor,
                  ),
                  child: Text(
                    labels[index],
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
