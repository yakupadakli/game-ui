import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// "Nothing here yet" placeholder — vertical layout with an [illustration]
/// (mascot, icon, or any widget), a [title] line, an optional [message]
/// paragraph below, and an optional [action] button.
///
/// Use as the empty-list state for game inventories, leaderboards, friend
/// lists, badges screens, etc.
class GameEmptyState extends StatelessWidget {
  const GameEmptyState({
    required this.title,
    this.illustration,
    this.message,
    this.action,
    this.titleStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: GameColors.textPrimary,
    ),
    this.messageStyle = const TextStyle(
      fontSize: 14,
      height: 1.45,
      color: GameColors.textSecondary,
    ),
    this.spacing = GameDesignTokens.spacingMD,
    this.padding = const EdgeInsets.all(GameDesignTokens.spacingXL),
    super.key,
  });

  final String title;
  final Widget? illustration;
  final String? message;
  final Widget? action;
  final TextStyle titleStyle;
  final TextStyle messageStyle;
  final double spacing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (illustration != null) ...[
            illustration!,
            SizedBox(height: spacing),
          ],
          Text(title, textAlign: TextAlign.center, style: titleStyle),
          if (message != null) ...[
            SizedBox(height: spacing / 2),
            Text(message!, textAlign: TextAlign.center, style: messageStyle),
          ],
          if (action != null) ...[SizedBox(height: spacing * 1.5), action!],
        ],
      ),
    );
  }
}
