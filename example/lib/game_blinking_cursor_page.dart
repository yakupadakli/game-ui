import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameBlinkingCursor] examples.
class GameBlinkingCursorPage extends StatelessWidget {
  const GameBlinkingCursorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameBlinkingCursor'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GameBlinkingCursor',
              subtitle: 'Fading text cursor',
              body:
                  'A simple blinking cursor — fades opacity in and out on a '
                  'fixed interval. Drop next to an input value to show the '
                  'active editing position.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Default',
              description: 'Width 3 · height 28 · 500ms interval.',
              child: Center(child: GameBlinkingCursor()),
            ),
            DocSection(
              title: 'Inline with a number',
              description:
                  'Common pattern: stroked answer text + cursor for input '
                  'fields.',
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GameStrokedText('42'),
                    SizedBox(width: 4),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: GameBlinkingCursor(color: GameColors.primary),
                    ),
                  ],
                ),
              ),
            ),
            DocSection(
              title: 'Fast blink',
              description: '200ms — for emphasis or short prompts.',
              child: Center(
                child: GameBlinkingCursor(
                  duration: Duration(milliseconds: 200),
                  color: GameColors.danger,
                  width: 4,
                  height: 32,
                ),
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameBlinkingCursor(\n'
              '  color: GameColors.primary,\n'
              '  duration: Duration(milliseconds: 500),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
