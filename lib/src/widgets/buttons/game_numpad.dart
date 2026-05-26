import 'package:flutter/widgets.dart';

import 'game_numpad_button.dart';

/// A 3-column numeric pad: rows of `1-2-3`, `4-5-6`, `7-8-9`, and a final
/// row with an optional clear (`C`), zero (`0`), and delete (`⌫`).
///
/// [onNumberTap] receives the digit string. [onDeleteTap] removes the last
/// entered digit. Pass [onClearTap] to enable the clear key (slot is empty
/// otherwise).
class GameNumpad extends StatelessWidget {
  const GameNumpad({
    required this.onNumberTap,
    required this.onDeleteTap,
    this.onClearTap,
    this.buttonWidth = 80,
    this.buttonHeight = 64,
    this.spacing = 8,
    this.enabled = true,
    super.key,
  });

  final ValueChanged<String> onNumberTap;
  final VoidCallback onDeleteTap;
  final VoidCallback? onClearTap;
  final double buttonWidth;
  final double buttonHeight;
  final double spacing;
  final bool enabled;

  GameNumpadButton _digit(String d) => GameNumpadButton(
    value: d,
    onTap: () => onNumberTap(d),
    width: buttonWidth,
    height: buttonHeight,
    enabled: enabled,
  );

  Widget _row(List<Widget> children) {
    final spaced = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) spaced.add(SizedBox(width: spacing));
      spaced.add(children[i]);
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: spaced);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _row([_digit('1'), _digit('2'), _digit('3')]),
        SizedBox(height: spacing),
        _row([_digit('4'), _digit('5'), _digit('6')]),
        SizedBox(height: spacing),
        _row([_digit('7'), _digit('8'), _digit('9')]),
        SizedBox(height: spacing),
        _row([
          if (onClearTap != null)
            GameNumpadButton(
              value: 'C',
              type: GameNumpadButtonType.clear,
              onTap: onClearTap!,
              width: buttonWidth,
              height: buttonHeight,
              enabled: enabled,
            )
          else
            SizedBox(width: buttonWidth),
          _digit('0'),
          GameNumpadButton(
            value: '⌫',
            type: GameNumpadButtonType.delete,
            onTap: onDeleteTap,
            width: buttonWidth,
            height: buttonHeight,
            enabled: enabled,
          ),
        ]),
      ],
    );
  }
}
