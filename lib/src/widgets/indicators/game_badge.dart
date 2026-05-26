import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Compact rounded label for tags / difficulty / status.
///
/// Defaults to brand-primary background with white text, BalooChettan2 bold.
/// Pass [color] for status tones (success / warning / danger), and an
/// optional [icon] before the label.
class GameBadge extends StatelessWidget {
  const GameBadge({
    required this.label,
    this.color = GameColors.primary,
    this.textColor = const Color(0xFFFFFFFF),
    this.fontSize = GameDesignTokens.fontSM,
    this.fontWeight = FontWeight.w700,
    this.fontFamily = 'BalooChettan2',
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
    this.borderRadius,
    super.key,
  });

  final String label;
  final Color color;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Widget? icon;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            borderRadius ?? BorderRadius.circular(GameDesignTokens.radiusSM),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 6)],
          Text(
            label,
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
