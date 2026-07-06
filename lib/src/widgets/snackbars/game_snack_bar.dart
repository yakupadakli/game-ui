import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_ui_strings_theme.dart';

/// Semantic variants for [GameSnackBar].
enum GameSnackBarType { info, success, warning, error }

/// Toast-style notification with the game border + per-type semantic color.
///
/// Pair with [showGameSnackBar] to surface it via the standard
/// [ScaffoldMessenger] flow. The [icon] override replaces the default
/// per-type glyph; otherwise [type] picks the icon and tint.
class GameSnackBar extends StatelessWidget {
  const GameSnackBar({
    required this.message,
    this.type = GameSnackBarType.info,
    this.icon,
    super.key,
  });

  final String message;
  final GameSnackBarType type;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = _backgroundFor(type);
    final glyph = icon ?? _iconFor(type);
    return Semantics(
      container: true,
      liveRegion: true,
      label: context.gameUiStrings.semanticSnackBar,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: GameDesignTokens.spacingMD,
          vertical: GameDesignTokens.spacingMD,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(glyph, color: Colors.white, size: 20),
            const SizedBox(width: GameDesignTokens.spacingSM),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Color _backgroundFor(GameSnackBarType type) {
    switch (type) {
      case GameSnackBarType.info:
        return GameColors.primary;
      case GameSnackBarType.success:
        return GameColors.success;
      case GameSnackBarType.warning:
        return GameColors.warning;
      case GameSnackBarType.error:
        return GameColors.danger;
    }
  }

  static IconData _iconFor(GameSnackBarType type) {
    switch (type) {
      case GameSnackBarType.info:
        return Icons.info_outline;
      case GameSnackBarType.success:
        return Icons.check_circle;
      case GameSnackBarType.warning:
        return Icons.warning_amber;
      case GameSnackBarType.error:
        return Icons.error_outline;
    }
  }
}

/// Shows a [GameSnackBar] via [ScaffoldMessenger] with floating behavior.
void showGameSnackBar(
  BuildContext context, {
  required String message,
  GameSnackBarType type = GameSnackBarType.info,
  IconData? icon,
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: GameSnackBar(message: message, type: type, icon: icon),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      duration: duration,
    ),
  );
}
