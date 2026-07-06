import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

const List<String> _row1 = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
const List<String> _row2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
const List<String> _row3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

/// QWERTY-style soft keyboard. Emits letter taps through [onKeyTap], delete
/// presses through [onDeleteTap], and optional space presses through
/// [onSpaceTap].
///
/// All keys autosize to fit the available width while respecting
/// [keySpacing]. The delete key spans 1.5 column widths; the space bar
/// (rendered only when [onSpaceTap] is non-null) spans the full row.
class GameKeyboard extends StatelessWidget {
  const GameKeyboard({
    required this.onKeyTap,
    required this.onDeleteTap,
    this.onSpaceTap,
    this.keyHeight = 44.0,
    this.keySpacing = 4.0,
    this.keyColor = Colors.white,
    this.keyTextColor = GameColors.textPrimary,
    this.keyShadowColor = GameColors.inactive,
    super.key,
  });

  final ValueChanged<String> onKeyTap;
  final VoidCallback onDeleteTap;
  final VoidCallback? onSpaceTap;
  final double keyHeight;
  final double keySpacing;
  final Color keyColor;
  final Color keyTextColor;
  final Color keyShadowColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final unitWidth =
            (maxWidth - (_row1.length - 1) * keySpacing) / _row1.length;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLetterRow(_row1, unitWidth),
            SizedBox(height: keySpacing),
            _buildLetterRow(_row2, unitWidth),
            SizedBox(height: keySpacing),
            _buildRow3(unitWidth),
            if (onSpaceTap != null) ...[
              SizedBox(height: keySpacing),
              _buildSpaceRow(maxWidth),
            ],
          ],
        );
      },
    );
  }

  Widget _buildLetterRow(List<String> letters, double unitWidth) {
    final children = <Widget>[];
    for (var i = 0; i < letters.length; i++) {
      if (i > 0) children.add(SizedBox(width: keySpacing));
      children.add(_letterKey(letters[i], unitWidth));
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: children);
  }

  Widget _buildRow3(double unitWidth) {
    // Delete (1.5 units) + 7 letters with spacing between.
    final children = <Widget>[
      _deleteKey(unitWidth * 1.5),
      SizedBox(width: keySpacing),
    ];
    for (var i = 0; i < _row3.length; i++) {
      if (i > 0) children.add(SizedBox(width: keySpacing));
      children.add(_letterKey(_row3[i], unitWidth));
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: children);
  }

  Widget _buildSpaceRow(double maxWidth) {
    return _KeyButton(
      width: maxWidth,
      height: keyHeight,
      color: keyColor,
      shadowColor: keyShadowColor,
      onTap: onSpaceTap!,
      child: Icon(Icons.space_bar, color: keyTextColor, size: 22),
    );
  }

  Widget _letterKey(String letter, double width) {
    return _KeyButton(
      width: width,
      height: keyHeight,
      color: keyColor,
      shadowColor: keyShadowColor,
      onTap: () => onKeyTap(letter),
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: keyTextColor,
        ),
      ),
    );
  }

  Widget _deleteKey(double width) {
    return _KeyButton(
      width: width,
      height: keyHeight,
      color: keyColor,
      shadowColor: keyShadowColor,
      onTap: onDeleteTap,
      child: Icon(Icons.backspace_outlined, color: keyTextColor, size: 20),
    );
  }
}

class _KeyButton extends StatelessWidget {
  const _KeyButton({
    required this.width,
    required this.height,
    required this.color,
    required this.shadowColor,
    required this.onTap,
    required this.child,
  });

  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GameTapScale(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(GameDesignTokens.radiusSM),
          border: Border.all(color: shadowColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 2),
              blurRadius: 0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
