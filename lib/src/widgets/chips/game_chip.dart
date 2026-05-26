import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Pill-shaped toggle chip used for filters and tags. Switches between two
/// styles based on [selected]: filled when on, tinted-outline when off.
/// Wrapped in [GameTapScale] so the press is felt before [onTap] fires.
class GameChip extends StatelessWidget {
  const GameChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.color = GameColors.primary,
    this.leading,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color color;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? const Color(0xFFFFFFFF) : color;
    final background = selected ? color : color.withValues(alpha: 0.12);

    return GameTapScale(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: GameDesignTokens.spacingMD,
          vertical: GameDesignTokens.spacingSM,
        ),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(GameDesignTokens.radiusPill),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              DefaultTextStyle.merge(
                style: TextStyle(color: foreground),
                child: IconTheme.merge(
                  data: IconThemeData(color: foreground, size: 16),
                  child: leading!,
                ),
              ),
              const SizedBox(width: GameDesignTokens.spacingXS),
            ],
            Text(
              label,
              style: TextStyle(
                color: foreground,
                fontSize: GameDesignTokens.fontMD,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
