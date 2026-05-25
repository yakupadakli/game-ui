import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Large stroked headline, typically rendered in [BalooChettan2] for the
/// chunky game-title feel. Defaults to white fill + brand-primary stroke.
class GameStrokedTitle extends StatelessWidget {
  const GameStrokedTitle(
    this.text, {
    this.fontSize = GameDesignTokens.font2XL,
    this.strokeColor = GameColors.primary,
    this.fillColor = const Color(0xFFFFFFFF),
    this.strokeWidth = 2.0,
    this.fontFamily = 'BalooChettan2',
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.center,
    this.lineHeight,
    super.key,
  });

  final String text;
  final double fontSize;
  final Color strokeColor;
  final Color fillColor;
  final double strokeWidth;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            height: lineHeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..strokeJoin = StrokeJoin.round
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            height: lineHeight,
            color: fillColor,
          ),
        ),
      ],
    );
  }
}
