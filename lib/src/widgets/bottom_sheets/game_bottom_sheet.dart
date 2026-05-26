import 'package:flutter/material.dart';

import '../../core/game_design_tokens.dart';

/// Modal bottom sheet with the chunky game-style border, rounded top corners,
/// and a drag handle.
///
/// Three optional slots: [title], [child], and [actions]. Use the
/// [showGameBottomSheet] helper to display it via the standard
/// [showModalBottomSheet] flow.
class GameBottomSheet extends StatelessWidget {
  const GameBottomSheet({
    this.title,
    required this.child,
    this.actions,
    this.color = Colors.white,
    this.borderColor = const Color(0xFFB7C8D9),
    super.key,
  });

  final Widget? title;
  final Widget child;
  final List<Widget>? actions;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(GameDesignTokens.radiusLG),
          topRight: Radius.circular(GameDesignTokens.radiusLG),
        ),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: GameDesignTokens.spacingMD),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCFD8E3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            if (title != null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  GameDesignTokens.spacingLG,
                  GameDesignTokens.spacingLG,
                  GameDesignTokens.spacingLG,
                  GameDesignTokens.spacingMD,
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: GameDesignTokens.fontXL,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                  child: title!,
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Color(0xFFE5E9F0)),
            ],
            Padding(
              padding: const EdgeInsets.all(GameDesignTokens.spacingLG),
              child: child,
            ),
            if (actions != null && actions!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  GameDesignTokens.spacingLG,
                  0,
                  GameDesignTokens.spacingLG,
                  GameDesignTokens.spacingLG,
                ),
                child: Wrap(
                  spacing: GameDesignTokens.spacingMD,
                  runSpacing: GameDesignTokens.spacingMD,
                  alignment: WrapAlignment.center,
                  children: actions!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Shows a [GameBottomSheet] via [showModalBottomSheet] with a transparent
/// background so the sheet's own rounded corners + border render cleanly.
Future<T?> showGameBottomSheet<T>(
  BuildContext context, {
  Widget? title,
  required Widget child,
  List<Widget>? actions,
  bool isDismissible = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isDismissible: isDismissible,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) =>
        GameBottomSheet(title: title, actions: actions, child: child),
  );
}
