import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameAwardImage] examples.
class GameAwardsPage extends StatelessWidget {
  const GameAwardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Awards'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameAwardImage',
              subtitle: 'Medals, trophies, badges, ribbons, stars (19)',
              body:
                  'Achievement art for result screens and trophy shelves — '
                  'bronze/silver/gold medals, trophy variants, badges, a '
                  'ribbon, and presentation stars.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All awards',
              description: 'GameAward.values — 19 bundled illustrations.',
              child: _AwardGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameAwardImage(\n'
              '  award: GameAward.medalGold,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _AwardGrid extends StatelessWidget {
  const _AwardGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameAward.values
          .map(
            (a) => SizedBox(
              width: 96,
              child: Column(
                children: [
                  GameAwardImage(award: a, size: 80),
                  const SizedBox(height: 4),
                  Text(
                    a.name,
                    style: DocTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
