import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_disabled_overlay.dart';
import '../../painters/game_gloss_painter.dart';
import '../text/game_stroked_text.dart';

/// Difficulty levels for [GameDifficultyButton]. Each maps to a preset face
/// color (green / orange / red) and a default label.
enum GameDifficulty {
  easy(color: Color(0xFF7AC74F), label: 'Easy'),
  medium(color: Color(0xFFFF9F43), label: 'Medium'),
  hard(color: Color(0xFFE45A5A), label: 'Hard');

  const GameDifficulty({required this.color, required this.label});

  /// Preset face color for this level.
  final Color color;

  /// Default label shown beneath the icon (override via
  /// [GameDifficultyButton.label]).
  final String label;
}

/// Named size presets for [GameDifficultyButton] (square edge, logical
/// pixels). [size] also accepts any raw number; these are the recommended
/// defaults.
abstract final class GameDifficultyButtonSize {
  GameDifficultyButtonSize._();

  static const double sm = 88;
  static const double md = 112;
  static const double lg = 140;
}

/// Glossy rounded-square difficulty tile — a pale outer frame, a colored
/// gradient face with a corner gloss highlight, an image placeholder icon,
/// and a stroked label.
///
/// The [difficulty] picks the preset palette and default [label]; override
/// [label] or [color] for full control. Press-scale and disabled state are
/// handled via the shared wrappers.
class GameDifficultyButton extends StatelessWidget {
  const GameDifficultyButton({
    required this.difficulty,
    this.onTap,
    this.label,
    this.color,
    this.size = GameDifficultyButtonSize.md,
    this.enabled = true,
    super.key,
  });

  final GameDifficulty difficulty;
  final VoidCallback? onTap;

  /// Overrides [GameDifficulty.label].
  final String? label;

  /// Overrides [GameDifficulty.color] (face color; frame/border/gloss are
  /// derived from it).
  final Color? color;

  /// Square edge length.
  final double size;
  final bool enabled;

  Color get _face => color ?? difficulty.color;
  String get _label => label ?? difficulty.label;

  @override
  Widget build(BuildContext context) {
    final face = _face;
    final outerColor = GameColors.lighten(face, 0.40);
    final borderColor = GameColors.darken(face, 0.22);
    final glossColor = GameColors.lighten(face, 0.28);
    final radius = size * 0.22;
    final inset = size * 0.06;

    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(
        enabled: enabled && onTap != null,
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: [
              // Pale outer frame.
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: outerColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              ),
              // Colored gradient face.
              Positioned(
                top: inset,
                left: inset,
                right: inset,
                bottom: inset,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius - inset),
                    border: Border.all(color: borderColor, width: 3),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [GameColors.lighten(face, 0.10), face],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size * 0.12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ImagePlaceholder(size: size * 0.34, color: face),
                        SizedBox(height: size * 0.07),
                        GameStrokedText(
                          _label,
                          color: Colors.white,
                          strokeColor: borderColor,
                          fontSize: size * 0.17,
                          strokeWidth: size * 0.012,
                          fontFamily: GameDesignTokens.fontFamilyDisplay,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Corner gloss highlight.
              Positioned(
                top: size * 0.16,
                left: size * 0.14,
                child: CustomPaint(
                  size: Size(size * 0.16, size * 0.16),
                  painter: GameGlossPainter(color: glossColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Translucent rounded tile with a mountain + sun glyph — the classic
/// "image goes here" placeholder shown on a difficulty tile.
class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: GameColors.lighten(color, 0.30),
        borderRadius: BorderRadius.circular(size * 0.22),
      ),
      child: Icon(
        Icons.landscape_rounded,
        color: Colors.white.withValues(alpha: 0.9),
        size: size * 0.62,
      ),
    );
  }
}
