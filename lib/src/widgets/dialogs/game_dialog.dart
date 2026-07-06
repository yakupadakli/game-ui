import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Modal card with the chunky game-style border + drop shadow.
///
/// Three optional slots: [title], [content], and [actions]. Use the
/// [showGameDialog] helper to display it via the standard
/// [showDialog] / barrier flow.
class GameDialog extends StatelessWidget {
  const GameDialog({
    this.title,
    this.content,
    this.actions,
    this.color = Colors.white,
    this.borderColor = GameColors.border,
    this.borderWidth = 3.0,
    this.borderRadius = GameDesignTokens.radiusLG,
    this.padding = const EdgeInsets.all(GameDesignTokens.spacingLG),
    this.maxWidth = 380.0,
    super.key,
  });

  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: GameDesignTokens.spacingXL,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) ...[
                title!,
                const SizedBox(height: GameDesignTokens.spacingMD),
              ],
              if (content != null) ...[
                content!,
                const SizedBox(height: GameDesignTokens.spacingLG),
              ],
              if (actions != null && actions!.isNotEmpty)
                Wrap(
                  spacing: GameDesignTokens.spacingMD,
                  runSpacing: GameDesignTokens.spacingMD,
                  alignment: WrapAlignment.center,
                  children: actions!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shows a [GameDialog] via [showDialog] with a semi-transparent barrier.
Future<T?> showGameDialog<T>(
  BuildContext context, {
  Widget? title,
  Widget? content,
  List<Widget>? actions,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withValues(alpha: 0.55),
    builder: (_) =>
        GameDialog(title: title, content: content, actions: actions),
  );
}
