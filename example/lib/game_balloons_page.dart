import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameBalloonImage] examples.
class GameBalloonsPage extends StatelessWidget {
  const GameBalloonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Balloons'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameBalloonImage',
              subtitle: 'Floating color balloons (4 tones)',
              body:
                  'Celebration and ambient decoration balloons in blue, '
                  'green, purple, and yellow. Pass onTap for a tappable '
                  'picker.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All balloons',
              description: 'GameBalloon.values — 4 color variants.',
              child: _BalloonGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameBalloonImage(\n'
              '  balloon: GameBalloon.purple,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _BalloonGrid extends StatelessWidget {
  const _BalloonGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameBalloon.values
          .map(
            (b) => Column(
              children: [
                GameBalloonImage(balloon: b, size: 90),
                const SizedBox(height: 4),
                Text(b.name, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}
