import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameKeyboard] examples.
class GameKeyboardPage extends StatefulWidget {
  const GameKeyboardPage({super.key});

  @override
  State<GameKeyboardPage> createState() => _GameKeyboardPageState();
}

class _GameKeyboardPageState extends State<GameKeyboardPage> {
  String _value = '';

  void _handleKey(String key) {
    setState(() => _value = _value + key);
  }

  void _handleDelete() {
    if (_value.isEmpty) return;
    setState(() => _value = _value.substring(0, _value.length - 1));
  }

  void _handleSpace() {
    setState(() => _value = '$_value ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameKeyboard'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameKeyboard',
              subtitle: 'QWERTY soft keyboard',
              body:
                  'Custom on-screen keyboard for word games, spelling drills, '
                  'and gated puzzle input. Keys autosize to the available '
                  'width; pass onSpaceTap to enable the space bar row.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Live demo',
              description:
                  'Type into the input display above. Delete removes one '
                  'character; the space bar inserts a space.',
              child: Column(
                children: [
                  GameInputDisplay(value: _value),
                  const SizedBox(height: 16),
                  GameKeyboard(
                    onKeyTap: _handleKey,
                    onDeleteTap: _handleDelete,
                    onSpaceTap: _handleSpace,
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'No space bar',
              description: 'Omit onSpaceTap for letter-only quizzes.',
              child: GameKeyboard(
                onKeyTap: _handleKey,
                onDeleteTap: _handleDelete,
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameKeyboard(\n'
              '  onKeyTap: (letter) => controller.append(letter),\n'
              '  onDeleteTap: controller.backspace,\n'
              '  onSpaceTap: controller.space,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
