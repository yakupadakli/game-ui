import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';

/// Horizontal step / progress indicator — alternating circular dots and
/// connecting line segments.
///
/// Dots before [currentIndex] render as completed (filled with
/// [completedColor] + check icon). The dot at [currentIndex] uses
/// [activeColor]; later dots use [inactiveColor]. Line segments are colored
/// completed up to (but not including) the active dot.
class GameStepIndicator extends StatelessWidget {
  const GameStepIndicator({
    required this.count,
    required this.currentIndex,
    this.activeColor = GameColors.primary,
    this.completedColor = GameColors.success,
    this.inactiveColor = const Color(0xFFCFD8E3),
    this.dotSize = 28.0,
    this.lineHeight = 2.0,
    super.key,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color completedColor;
  final Color inactiveColor;
  final double dotSize;
  final double lineHeight;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var i = 0; i < count; i++) {
      children.add(_buildDot(i));
      if (i < count - 1) {
        children.add(
          Expanded(
            child: Container(
              height: lineHeight,
              color: i < currentIndex ? completedColor : inactiveColor,
            ),
          ),
        );
      }
    }
    return Row(children: children);
  }

  Widget _buildDot(int index) {
    final isCompleted = index < currentIndex;
    final isActive = index == currentIndex;
    final color = isCompleted
        ? completedColor
        : isActive
        ? activeColor
        : inactiveColor;

    return Container(
      width: dotSize,
      height: dotSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: isCompleted
          ? Icon(
              _checkIcon,
              size: dotSize * 0.55,
              color: const Color(0xFFFFFFFF),
            )
          : Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: dotSize * 0.45,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFFFFF),
                height: 1.0,
              ),
            ),
    );
  }
}

const IconData _checkIcon = IconData(
  0xe156,
  fontFamily: 'MaterialIcons',
  matchTextDirection: false,
);
