import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GamePanel] and [GameSpeechBubble] examples.
class GamePanelsPage extends StatelessWidget {
  const GamePanelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Panels'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GamePanel / GameSpeechBubble',
              subtitle: 'Framed surfaces behind text content',
              body:
                  'GamePanel paints a bundled framed-panel PNG behind a child '
                  '(blue card, answer box, wooden board). GameSpeechBubble '
                  'does the same with the answer bubble art (rounded shape + '
                  'tail).',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'GamePanel variants',
              description: 'GamePanelVariant.cardBlue / answerBox / woodBoard.',
              child: _PanelColumn(),
            ),
            DocSection(
              title: 'GameSpeechBubble',
              description: 'Answer bubble wrapping arbitrary content.',
              child: _BubbleExample(),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GamePanel(\n'
              '  variant: GamePanelVariant.woodBoard,\n'
              "  child: const Text('Chapter 1'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _PanelColumn extends StatelessWidget {
  const _PanelColumn();

  static const List<(GamePanelVariant, String)> _items = [
    (GamePanelVariant.cardBlue, 'Blue card panel'),
    (GamePanelVariant.answerBox, '42'),
    (GamePanelVariant.woodBoard, 'Chapter 1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _items
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GamePanel(
                variant: e.$1,
                width: 240,
                height: 110,
                child: Center(
                  child: Text(
                    e.$2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _BubbleExample extends StatelessWidget {
  const _BubbleExample();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GameSpeechBubble(
        width: 220,
        height: 120,
        child: Center(
          child: Text(
            'Great job!',
            style: TextStyle(
              color: Color(0xFF3A2E1A),
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
