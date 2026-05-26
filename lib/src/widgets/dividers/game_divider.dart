import 'package:flutter/widgets.dart';

import '../../core/game_design_tokens.dart';

/// Horizontal divider line, optionally with a centered widget such as a
/// label or icon. When [center] is null, renders a single thin line of
/// [thickness] and [color]. When [center] is provided, splits the line in
/// two with the widget inset by [centerPadding] on either side.
class GameDivider extends StatelessWidget {
  const GameDivider({
    this.thickness = 2.0,
    this.color = const Color(0xFFCFD8E3),
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.center,
    this.centerPadding = GameDesignTokens.spacingMD,
    super.key,
  });

  final double thickness;
  final Color color;
  final double indent;
  final double endIndent;
  final Widget? center;
  final double centerPadding;

  @override
  Widget build(BuildContext context) {
    final line = Container(height: thickness, color: color);

    if (center == null) {
      return Padding(
        padding: EdgeInsets.only(left: indent, right: endIndent),
        child: line,
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: indent, right: endIndent),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: line),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: centerPadding),
            child: center,
          ),
          Expanded(child: line),
        ],
      ),
    );
  }
}
