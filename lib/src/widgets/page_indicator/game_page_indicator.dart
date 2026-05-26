import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';

/// Page / step indicator — a horizontal row of dots that morph into pills
/// when active. Use beneath an onboarding [PageView], a level intro
/// carousel, or any paged surface.
///
/// The active index draws a wider rounded bar; inactive indices are
/// circles. Tap forwarding is left to the parent (e.g. wrap in
/// [GestureDetector] per index if you want jump-to navigation).
class GamePageIndicator extends StatelessWidget {
  const GamePageIndicator({
    required this.count,
    required this.currentIndex,
    this.activeColor = GameColors.primary,
    this.inactiveColor = const Color(0xFFCFD8E3),
    this.dotSize = 10.0,
    this.activeWidth = 28.0,
    this.spacing = 6.0,
    this.animationDuration = const Duration(milliseconds: 220),
    super.key,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;

  /// Width of the active pill — height stays at [dotSize].
  final double activeWidth;
  final double spacing;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: AnimatedContainer(
            duration: animationDuration,
            width: isActive ? activeWidth : dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(dotSize / 2),
            ),
          ),
        );
      }),
    );
  }
}
