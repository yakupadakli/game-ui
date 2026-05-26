import 'package:flutter/material.dart';

import '../../animations/game_blinking_cursor.dart';
import '../../core/game_design_tokens.dart';

/// Read-only display showing a typed [value] followed by a
/// [GameBlinkingCursor] — used to surface the in-progress answer in numpad /
/// keypad flows where the actual text input lives elsewhere (e.g. in a
/// controller fed by tap callbacks).
///
/// Defaults mimic a light-blue answer chip — override [backgroundColor],
/// [borderColor], and [textColor] to retheme.
class GameInputDisplay extends StatelessWidget {
  const GameInputDisplay({
    required this.value,
    this.height = 50.0,
    this.fontSize = GameDesignTokens.font3XL,
    this.backgroundColor = const Color(0xFFDBE5EE),
    this.borderColor = const Color(0xFF567F91),
    this.textColor = const Color(0xFF2D5A7B),
    this.borderWidth = 2.0,
    this.borderRadius = GameDesignTokens.radiusMD,
    this.showCursor = true,
    super.key,
  });

  final String value;
  final double height;
  final double fontSize;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;
  final double borderRadius;
  final bool showCursor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            if (showCursor) ...[
              const SizedBox(width: 2),
              GameBlinkingCursor(color: textColor, height: fontSize - 4),
            ],
          ],
        ),
      ),
    );
  }
}
