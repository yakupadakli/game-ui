import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameContentCard] examples.
class GameContentCardPage extends StatelessWidget {
  const GameContentCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameContentCard'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameContentCard',
              subtitle: 'Rounded card with optional mascot + bottom slot',
              body:
                  'Generic content card with a thick rim, drop shadow, and '
                  'two optional slots: a mascot floating off the left edge, '
                  'and a bottom row (input, action buttons).',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Content only',
              description: 'Just a child — no mascot, no bottom slot.',
              child: GameContentCard(
                child: GameStrokedText(
                  '12 + 7 = ?',
                  color: Colors.white,
                  strokeColor: Colors.black,
                ),
              ),
            ),
            const DocSection(
              title: 'With mascot',
              description: 'Mascot peeks out of the left edge.',
              child: GameContentCard(
                mascot: GameMascotImage(
                  mascot: GameMascot.fox,
                  pose: GameMascotPose.thinking,
                  size: 110,
                ),
                child: GameStrokedText(
                  '8 × 3 = ?',
                  color: Colors.white,
                  strokeColor: Colors.black,
                ),
              ),
            ),
            const DocSection(
              title: 'With bottom slot',
              description: 'Input display below — taller card, mascot lifts.',
              child: GameContentCard(
                mascot: GameMascotImage(
                  mascot: GameMascot.bear,
                  pose: GameMascotPose.pointing,
                  size: 130,
                ),
                bottom: GameInputDisplay(value: '15'),
                child: GameStrokedText(
                  '9 + 6 = ?',
                  color: Colors.white,
                  strokeColor: Colors.black,
                ),
              ),
            ),
            const DocSection(
              title: 'Themed',
              description:
                  'Tinted card surface — swap color + borderColor for the '
                  'sunny variant.',
              child: GameContentCard(
                color: Color(0xFFFFF3CC),
                borderColor: Color(0xFFE0B33A),
                child: Text(
                  'Generic prompt card — works without math.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameContentCard(\n'
              '  mascot: GameMascotImage(\n'
              '    mascot: GameMascot.fox,\n'
              '    pose: GameMascotPose.thinking,\n'
              '  ),\n'
              '  bottom: GameInputDisplay(value: typed),\n'
              "  child: GameStrokedText('8 × 3 = ?'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
