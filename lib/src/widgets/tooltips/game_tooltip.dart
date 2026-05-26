import 'package:flutter/material.dart';

import '../../core/game_design_tokens.dart';

/// Wraps Material's [Tooltip] with a game-style bubble — white surface,
/// rounded corners, soft border and drop shadow. Apply by wrapping any
/// widget; the bubble appears on long-press (mobile) or hover (desktop).
class GameTooltip extends StatelessWidget {
  const GameTooltip({
    required this.message,
    required this.child,
    this.color = const Color(0xFFFFFFFF),
    this.borderColor = const Color(0xFFB7C8D9),
    this.textColor = const Color(0xFF1A1A1A),
    super.key,
  });

  final String message;
  final Widget child;
  final Color color;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: GameDesignTokens.spacingMD,
        vertical: GameDesignTokens.spacingSM,
      ),
      textStyle: TextStyle(
        color: textColor,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      child: child,
    );
  }
}
