import 'package:flutter/widgets.dart';

import '../../core/game_design_tokens.dart';

/// Text rendered as a stroked outline + filled fill on top — the chunky
/// "game character number" look (e.g. white "5" with dark stroke on a
/// button face).
///
/// Defaults to the bundled [GameDesignTokens.fontFamily] (Fredoka).
class GameStrokedText extends StatelessWidget {
  const GameStrokedText(
    this.text, {
    this.color = const Color(0xFFFFFFFF),
    this.strokeColor = const Color(0xFF000000),
    this.fontSize = GameDesignTokens.font3XL,
    this.strokeWidth = 3.0,
    this.fontFamily = GameDesignTokens.fontFamily,
    this.fontWeight = FontWeight.w700,
    this.textAlign = TextAlign.center,
    super.key,
  });

  final String text;
  final Color color;
  final Color strokeColor;
  final double fontSize;
  final double strokeWidth;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;

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
            height: 1.0,
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
            height: 1.0,
            color: color,
          ),
        ),
      ],
    );
  }
}
