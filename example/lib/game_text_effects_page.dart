import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameStrokedText] and [GameStrokedTitle] examples.
class GameTextEffectsPage extends StatelessWidget {
  const GameTextEffectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Text effects'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'Stroked text',
              subtitle: 'GameStrokedText · GameStrokedTitle',
              body:
                  'Chunky game-style text rendered as stroke + fill via a '
                  'Stack of two Text widgets. Use the Text variant for '
                  'numbers/labels on buttons, the Title variant for hero '
                  'headlines in Baloo Chettan 2.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'GameStrokedText — default (Fredoka)',
              description: 'White fill with black stroke; size 28.',
              child: Center(child: GameStrokedText('123')),
            ),
            const DocSection(
              title: 'GameStrokedText — colored fill',
              description:
                  'Override color/strokeColor for variant tones (e.g. brand '
                  'success / danger).',
              child: _ColoredRow(),
            ),
            const DocSection(
              title: 'GameStrokedTitle — default (BalooChettan2)',
              description:
                  'White fill, primary brand stroke, large font for hero '
                  'titles.',
              child: Center(child: GameStrokedTitle('Math is Fun!')),
            ),
            const DocSection(
              title: 'GameStrokedTitle — custom stroke',
              description: 'Pass strokeColor to coordinate with section tone.',
              child: Center(
                child: GameStrokedTitle(
                  'Level Cleared',
                  strokeColor: GameColors.success,
                  fontSize: 28,
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              "GameStrokedText('42', fontSize: 36)\n"
              "GameStrokedTitle('Math is Fun!')",
            ),
          ],
        ),
      ),
    );
  }
}

class _ColoredRow extends StatelessWidget {
  const _ColoredRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        GameStrokedText(
          '5',
          color: Colors.white,
          strokeColor: GameColors.primary,
        ),
        GameStrokedText(
          '+',
          color: Colors.white,
          strokeColor: GameColors.success,
        ),
        GameStrokedText(
          '8',
          color: Colors.white,
          strokeColor: GameColors.danger,
        ),
        GameStrokedText(
          '=',
          color: Colors.white,
          strokeColor: GameColors.accent,
        ),
        GameStrokedText(
          '13',
          color: Colors.white,
          strokeColor: GameColors.warning,
        ),
      ],
    );
  }
}
