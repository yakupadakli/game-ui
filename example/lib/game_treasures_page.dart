import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTreasureImage] examples.
class GameTreasuresPage extends StatelessWidget {
  const GameTreasuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Treasures'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameTreasureImage',
              subtitle: 'Treasure chests (8 illustrations)',
              body:
                  'Closed and open chests in gold and silver, plus reward '
                  'spills (coins, stars, gems, glow). Pass onTap for a '
                  'tap-to-open reward chest.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All chests',
              description: 'GameTreasure.values — 8 bundled illustrations.',
              child: _TreasureGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameTreasureImage(\n'
              '  treasure: GameTreasure.openCoinsGold,\n'
              '  size: 120,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _TreasureGrid extends StatelessWidget {
  const _TreasureGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameTreasure.values
          .map(
            (t) => SizedBox(
              width: 110,
              child: Column(
                children: [
                  GameTreasureImage(treasure: t, size: 96),
                  const SizedBox(height: 4),
                  Text(
                    t.name,
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
