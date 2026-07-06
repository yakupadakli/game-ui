import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_ui_strings_theme.dart';

/// Named default height for [GameProgressBar] (logical pixels). [height]
/// also accepts any raw number; this is the recommended default.
abstract final class GameProgressBarSize {
  GameProgressBarSize._();

  static const double height = 24;
}

/// Pill-shaped progress bar — chunky rim + inner fill that grows from left
/// to right. Use for level progress, XP, loading screens, etc.
///
/// [value] clamps to `[0, 1]`. Pass [animationDuration] (default 250ms) for
/// a smooth tween between value changes; set to [Duration.zero] to snap.
class GameProgressBar extends StatelessWidget {
  const GameProgressBar({
    required this.value,
    this.height = GameProgressBarSize.height,
    this.backgroundColor = const Color(0xFFEDEDED),
    this.fillColor = GameColors.primary,
    this.borderColor = GameColors.border,
    this.borderWidth = 2.0,
    this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 250),
    this.curve = Curves.easeOut,
    this.label,
    this.semanticLabel,
    super.key,
  });

  /// Progress in `[0, 1]` — values outside the range are clamped.
  final double value;
  final double height;
  final Color backgroundColor;
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  /// Override the auto-pill radius (defaults to `height / 2`).
  final double? borderRadius;
  final Duration animationDuration;
  final Curve curve;

  /// Optional widget rendered centered on top of the track (e.g. percentage
  /// text). Lay out separately if you need it outside the track.
  final Widget? label;

  /// Override for the semantics label. Falls back to the localized
  /// [GameUiStringsTheme.semanticLoading].
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);
    final radius = borderRadius ?? height / 2;

    return Semantics(
      container: true,
      label: semanticLabel ?? context.gameUiStrings.semanticLoading,
      value: '${(clamped * 100).round()}%',
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(color: borderColor, width: borderWidth),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return AnimatedContainer(
                    duration: animationDuration,
                    curve: curve,
                    width: constraints.maxWidth * clamped,
                    decoration: BoxDecoration(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  );
                },
              ),
              if (label != null)
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GameDesignTokens.spacingSM,
                    ),
                    child: Center(child: label),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
