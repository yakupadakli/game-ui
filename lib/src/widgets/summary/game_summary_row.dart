import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Bordered row that lays out a fixed set of summary items evenly.
///
/// Drop in any widgets — typically GameStatItem instances — and they'll
/// be distributed with [MainAxisAlignment.spaceEvenly]. An optional
/// [title] sits centered above the row.
class GameSummaryRow extends StatelessWidget {
  const GameSummaryRow({
    required this.items,
    this.title,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.borderColor = GameColors.border,
    this.padding = const EdgeInsets.all(GameDesignTokens.spacingMD),
    this.borderRadius = GameDesignTokens.radiusMD,
    this.borderWidth = 2.0,
    super.key,
  });

  final List<Widget> items;
  final String? title;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Center(
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: GameColors.textSecondary,
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items,
          ),
        ],
      ),
    );
  }
}
