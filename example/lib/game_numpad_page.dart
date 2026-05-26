import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameNumpad] examples.
class GameNumpadPage extends StatefulWidget {
  const GameNumpadPage({super.key});

  @override
  State<GameNumpadPage> createState() => _GameNumpadPageState();
}

class _GameNumpadPageState extends State<GameNumpadPage> {
  String _value = '';

  void _appendDigit(String d) {
    if (_value.length >= 9) return;
    setState(() => _value = _value + d);
  }

  void _deleteLast() {
    if (_value.isEmpty) return;
    setState(() => _value = _value.substring(0, _value.length - 1));
  }

  void _clear() => setState(() => _value = '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameNumpad'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameNumpad',
              subtitle: 'Numeric keypad with delete + optional clear',
              body:
                  '3-column grid: 1-2-3, 4-5-6, 7-8-9 and a final row with '
                  'optional clear, zero, and delete. Each key is a '
                  'GameNumpadButton (layered "rect button" with face + depth '
                  'rim + gloss).',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Try it',
              description:
                  'Tap keys to build the value, ⌫ to delete, C to clear.',
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: DocTheme.border),
                    ),
                    child: Center(
                      child: GameStrokedText(
                        _value.isEmpty ? '0' : _value,
                        strokeColor: GameColors.primary,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GameNumpad(
                    onNumberTap: _appendDigit,
                    onDeleteTap: _deleteLast,
                    onClearTap: _clear,
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Without clear (no C key, blank slot)',
              description:
                  'Skip onClearTap → the clear position renders as an empty '
                  'slot to keep the grid aligned.',
              child: _NoClearDemo(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameNumpad(\n'
              '  onNumberTap: (digit) => print(digit),\n'
              '  onDeleteTap: deleteLast,\n'
              '  onClearTap: clearAll, // optional\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _NoClearDemo extends StatelessWidget {
  const _NoClearDemo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GameNumpad(
        onNumberTap: (_) {},
        onDeleteTap: () {},
        buttonWidth: 64,
        buttonHeight: 52,
      ),
    );
  }
}
