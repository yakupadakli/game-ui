import 'package:flutter/material.dart';

import '../../core/game_button_size.dart';
import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../text/game_stroked_text.dart';
import 'game_tile_button.dart';

/// Difficulty levels for [GameDifficultyButton]. Each maps to a preset face
/// color (green / orange / red) and a default label. The colors are tuned to
/// read as glossy plastic.
enum GameDifficulty {
  easy(color: Color(0xFF60C177), label: 'Easy'),
  medium(color: Color(0xFFFF8529), label: 'Medium'),
  hard(color: Color(0xFFED4647), label: 'Hard');

  const GameDifficulty({required this.color, required this.label});

  /// Preset face color for this level.
  final Color color;

  /// Default label shown beneath the icon (override via
  /// [GameDifficultyButton.label]).
  final String label;
}

/// A [GameTileButton] preset for difficulty selection: a glossy rounded-square
/// tile carrying an image-placeholder glyph and a soft-shadowed label.
///
/// The [difficulty] picks the preset palette and default [label]; override
/// [label] or [color] for full control. The tile chrome, press-scale and
/// disabled state all come from [GameTileButton].
class GameDifficultyButton extends StatelessWidget {
  const GameDifficultyButton({
    required this.difficulty,
    this.onTap,
    this.label,
    this.color,
    this.size = GameButtonSize.large,
    this.enabled = true,
    super.key,
  });

  final GameDifficulty difficulty;
  final VoidCallback? onTap;

  /// Overrides [GameDifficulty.label].
  final String? label;

  /// Overrides [GameDifficulty.color] (the gradient body base; the rim, lip and
  /// inset edge are derived from it).
  final Color? color;

  /// Visual edge length of the square tile.
  final double size;

  final bool enabled;

  Color get _face => color ?? difficulty.color;
  String get _label => label ?? difficulty.label;

  @override
  Widget build(BuildContext context) {
    final face = _face;

    return GameTileButton(
      color: face,
      size: size,
      onTap: onTap,
      enabled: enabled,
      child: _TileContent(label: _label, size: size, color: face),
    );
  }
}

/// On-tile content: a tinted image-placeholder glyph above a soft-shadowed
/// label, wrapped in a scale-down [FittedBox].
class _TileContent extends StatelessWidget {
  const _TileContent({
    required this.label,
    required this.size,
    required this.color,
  });

  final String label;

  /// Reference edge length the glyph/label scale against.
  final double size;

  /// Face color the glyph is tinted from; the label shadow is derived from it.
  final Color color;

  @override
  Widget build(BuildContext context) {
    final shadowColor = GameColors.darken(color, 0.23);

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ImagePlaceholderGlyph(
            width: size * 0.35,
            height: size * 0.30,
            color: color,
          ),
          SizedBox(height: size * 0.068),
          _DifficultyLabel(label: label, size: size, shadowColor: shadowColor),
        ],
      ),
    );
  }
}

class _DifficultyLabel extends StatelessWidget {
  const _DifficultyLabel({
    required this.label,
    required this.size,
    required this.shadowColor,
  });

  final String label;
  final double size;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    final fontSize = size * 0.205;

    return SizedBox(
      width: size * 0.6,
      height: size * 0.22,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(size * 0.008, size * 0.014),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: shadowColor.withValues(alpha: 0.26),
                  fontFamily: GameDesignTokens.fontFamilyDisplay,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
            ),
            GameStrokedText(
              label,
              color: Colors.white,
              strokeColor: shadowColor.withValues(alpha: 0.34),
              fontSize: fontSize,
              strokeWidth: size * 0.006,
              fontFamily: GameDesignTokens.fontFamilyDisplay,
              fontWeight: FontWeight.w800,
            ),
          ],
        ),
      ),
    );
  }
}

/// Mountain + sun glyph — the classic "image goes here" placeholder, tinted to
/// the difficulty face color so it reads on the tile.
class _ImagePlaceholderGlyph extends StatelessWidget {
  const _ImagePlaceholderGlyph({
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _ImagePlaceholderPainter(color: color),
    );
  }
}

class _ImagePlaceholderPainter extends CustomPainter {
  const _ImagePlaceholderPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final mountainFill = Paint()
      ..color = GameColors.lighten(color, 0.26).withValues(alpha: 0.92)
      ..style = PaintingStyle.fill;
    final outline = Paint()
      ..color = GameColors.darken(color, 0.24).withValues(alpha: 0.86)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = size.height * 0.075;
    final sunFill = Paint()
      ..color = const Color(0xFFFFF0A3)
      ..style = PaintingStyle.fill;

    final mountain = Path()
      ..moveTo(size.width * 0.08, size.height * 0.82)
      ..cubicTo(
        size.width * 0.14,
        size.height * 0.67,
        size.width * 0.26,
        size.height * 0.45,
        size.width * 0.35,
        size.height * 0.32,
      )
      ..cubicTo(
        size.width * 0.41,
        size.height * 0.23,
        size.width * 0.48,
        size.height * 0.24,
        size.width * 0.53,
        size.height * 0.34,
      )
      ..lineTo(size.width * 0.59, size.height * 0.47)
      ..lineTo(size.width * 0.67, size.height * 0.36)
      ..cubicTo(
        size.width * 0.73,
        size.height * 0.27,
        size.width * 0.82,
        size.height * 0.28,
        size.width * 0.87,
        size.height * 0.39,
      )
      ..lineTo(size.width * 0.97, size.height * 0.76)
      ..cubicTo(
        size.width * 1.00,
        size.height * 0.89,
        size.width * 0.93,
        size.height * 0.97,
        size.width * 0.80,
        size.height * 0.97,
      )
      ..lineTo(size.width * 0.21, size.height * 0.97)
      ..cubicTo(
        size.width * 0.10,
        size.height * 0.97,
        size.width * 0.03,
        size.height * 0.90,
        size.width * 0.07,
        size.height * 0.82,
      )
      ..close();

    canvas.drawPath(mountain, mountainFill);
    canvas.drawPath(mountain, outline);

    final sunCenter = Offset(size.width * 0.73, size.height * 0.12);
    canvas.drawCircle(sunCenter, size.height * 0.15, sunFill);
    canvas.drawCircle(sunCenter, size.height * 0.15, outline);
  }

  @override
  bool shouldRepaint(covariant _ImagePlaceholderPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
