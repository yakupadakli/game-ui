import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_pressable.dart';
import '../../painters/game_gloss_painter.dart';
import '../text/game_stroked_text.dart';

/// Named default size for [GameActionButton] (logical pixels). [width],
/// [height], and [fontSize] also accept any raw number; these are the
/// recommended defaults.
abstract final class GameActionButtonSize {
  GameActionButtonSize._();

  static const double width = 120;
  static const double height = 60;
  static const double fontSize = 32;
}

/// Wide pill-shaped primary action button — outer white frame + colored
/// inner face, with a stroked label and a corner gloss highlight.
///
/// Defaults to the success green palette (e.g. "NEXT" / "SUBMIT"); pass
/// [color] to retheme, or set [borderColor] / [glossColor] for full control.
/// Disabled-state and press-scale handled via the shared wrappers.
class GameActionButton extends StatelessWidget {
  const GameActionButton({
    required this.label,
    required this.onTap,
    this.width = GameActionButtonSize.width,
    this.height = GameActionButtonSize.height,
    this.color = GameColors.success,
    this.borderColor,
    this.textColor = const Color(0xFFFDFFFE),
    this.strokeColor,
    this.glossColor,
    this.fontSize = GameActionButtonSize.fontSize,
    this.borderRadius = GameDesignTokens.radiusMD,
    this.borderWidth = 3.0,
    this.outerColor = Colors.white,
    this.enabled = true,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color color;
  final Color? borderColor;
  final Color textColor;
  final Color? strokeColor;
  final Color? glossColor;
  final double fontSize;
  final double borderRadius;
  final double borderWidth;
  final Color outerColor;
  final bool enabled;

  static const double _innerPadding = 4.0;

  Color get _effectiveBorderColor =>
      borderColor ?? GameColors.darken(color, 0.35);
  Color get _effectiveStrokeColor => strokeColor ?? _effectiveBorderColor;
  Color get _effectiveGlossColor =>
      glossColor ?? GameColors.lighten(color, 0.25);

  @override
  Widget build(BuildContext context) {
    return GamePressable(
      onTap: onTap,
      enabled: enabled,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: outerColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            Positioned(
              top: _innerPadding,
              left: _innerPadding,
              right: _innerPadding,
              bottom: _innerPadding,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    color: _effectiveBorderColor,
                    width: borderWidth,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: GameDesignTokens.spacingSM,
                      ),
                      child: GameStrokedText(
                        label,
                        color: textColor,
                        strokeColor: _effectiveStrokeColor,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.20,
              left: width * 0.10,
              child: CustomPaint(
                size: Size(width * 0.15, height * 0.20),
                painter: GameGlossPainter(color: _effectiveGlossColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
