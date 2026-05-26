import 'package:flutter/widgets.dart';

import '../../core/game_design_tokens.dart';

/// Layout helper for rows of action buttons.
///
/// Arrangement:
/// - 3 actions → `[2, 1]` (top row of two, single below)
/// - 4 actions → `[2, 2]`
/// - otherwise → rows of [maxPerRow] (default 3), left-to-right
///
/// Each row uses [Row] + [FittedBox(BoxFit.scaleDown)] so the children stay
/// visible if their natural width would overflow.
class GameActionGrid extends StatelessWidget {
  const GameActionGrid({
    required this.actions,
    this.maxPerRow = 3,
    this.horizontalSpacing = GameDesignTokens.spacingLG,
    this.verticalSpacing = GameDesignTokens.spacingMD,
    super.key,
  });

  final List<Widget> actions;
  final int maxPerRow;
  final double horizontalSpacing;
  final double verticalSpacing;

  List<List<Widget>> _splitRows() {
    final len = actions.length;
    if (len == 3) {
      return [actions.sublist(0, 2), actions.sublist(2, 3)];
    }
    if (len == 4) {
      return [actions.sublist(0, 2), actions.sublist(2, 4)];
    }
    final rows = <List<Widget>>[];
    for (var i = 0; i < len; i += maxPerRow) {
      final end = i + maxPerRow > len ? len : i + maxPerRow;
      rows.add(actions.sublist(i, end));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _splitRows().map((row) {
        return Padding(
          padding: EdgeInsets.only(bottom: verticalSpacing),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((action) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalSpacing / 2,
                  ),
                  child: action,
                );
              }).toList(),
            ),
          ),
        );
      }).toList(),
    );
  }
}
