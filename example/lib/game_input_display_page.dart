import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameInputDisplay] examples.
class GameInputDisplayPage extends StatefulWidget {
  const GameInputDisplayPage({super.key});

  @override
  State<GameInputDisplayPage> createState() => _GameInputDisplayPageState();
}

class _GameInputDisplayPageState extends State<GameInputDisplayPage> {
  String _value = '';

  void _onKey(String digit) {
    setState(() {
      if (digit == 'C') {
        _value = '';
      } else if (digit == '⌫') {
        if (_value.isNotEmpty) _value = _value.substring(0, _value.length - 1);
      } else if (_value.length < 6) {
        _value += digit;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameInputDisplay'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameInputDisplay',
              subtitle: 'Read-only value field with blinking cursor',
              body:
                  'Pair with a custom keypad (e.g. GameNumpad). The widget '
                  'paints the entered text and a fading cursor — input itself '
                  'lives in the parent state, not in this widget.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Live demo — tap the numpad',
              description: 'Value is held in the parent State.',
              child: Column(
                children: [
                  GameInputDisplay(value: _value),
                  const SizedBox(height: 16),
                  GameNumpad(
                    onNumberTap: _onKey,
                    onDeleteTap: () => _onKey('⌫'),
                    onClearTap: () => _onKey('C'),
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Static — without cursor',
              description: 'Pass showCursor: false for a settled display.',
              child: GameInputDisplay(value: '42', showCursor: false),
            ),
            const DocSection(
              title: 'Themed',
              description: 'Custom colors / border radius.',
              child: GameInputDisplay(
                value: 'YAKUP',
                backgroundColor: Color(0xFFFFF3CC),
                borderColor: Color(0xFFE0B33A),
                textColor: Color(0xFF7A4E00),
                borderRadius: 999,
                height: 56,
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameInputDisplay(\n'
              "  value: enteredText,\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
