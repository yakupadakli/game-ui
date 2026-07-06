import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_ui_strings_theme.dart';

/// Inline banner with icon + message + optional action / dismiss controls.
///
/// Persistent counterpart to [SnackBar]: stays mounted until the parent
/// drops it (typically via [onDismiss]). [color] tints the border, icon
/// and action label; [backgroundColor] defaults to a 15%-alpha wash of
/// [color] but can be overridden for solid fills.
class GameBanner extends StatelessWidget {
  const GameBanner({
    required this.message,
    this.icon,
    this.onDismiss,
    this.onActionTap,
    this.actionLabel,
    this.color = GameColors.warning,
    this.backgroundColor,
    super.key,
  });

  final String message;
  final IconData? icon;
  final VoidCallback? onDismiss;
  final VoidCallback? onActionTap;
  final String? actionLabel;
  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final strings = context.gameUiStrings;
    final bg = backgroundColor ?? color.withValues(alpha: 0.15);
    final hasAction = onActionTap != null && actionLabel != null;
    return Semantics(
      container: true,
      label: strings.semanticBanner,
      child: Container(
        padding: const EdgeInsets.all(GameDesignTokens.spacingMD),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: color, size: 24),
              const SizedBox(width: GameDesignTokens.spacingMD),
            ],
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: GameColors.textNavy,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ),
            if (hasAction) ...[
              const SizedBox(width: GameDesignTokens.spacingSM),
              TextButton(
                onPressed: onActionTap,
                style: TextButton.styleFrom(
                  foregroundColor: color,
                  padding: const EdgeInsets.symmetric(
                    horizontal: GameDesignTokens.spacingSM,
                    vertical: 4,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  actionLabel!.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
            if (onDismiss != null) ...[
              const SizedBox(width: 2),
              IconButton(
                onPressed: onDismiss,
                icon: const Icon(Icons.close, size: 18),
                tooltip: strings.semanticDismiss,
                color: color,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
