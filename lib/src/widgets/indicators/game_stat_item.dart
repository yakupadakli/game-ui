import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Vertical stat tile — icon + value + label, stacked. Used in summary
/// cards (e.g. "best streak: 12").
class GameStatItem extends StatelessWidget {
  const GameStatItem({
    required this.icon,
    required this.value,
    required this.label,
    this.color = GameColors.primary,
    this.iconSize = 22.0,
    this.valueFontSize = GameDesignTokens.fontLG,
    this.labelFontSize = GameDesignTokens.fontSM,
    this.labelColor = const Color(0xFF8B95A5),
    this.fontFamily = GameDesignTokens.fontFamily,
    super.key,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final double iconSize;
  final double valueFontSize;
  final double labelFontSize;
  final Color labelColor;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: iconSize),
        const SizedBox(height: 2),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: valueFontSize,
            fontWeight: FontWeight.w700,
            color: color,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: labelFontSize,
            color: labelColor,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
