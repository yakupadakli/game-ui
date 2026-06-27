import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameLevelIslandImage] examples.
class GameLevelIslandsPage extends StatelessWidget {
  const GameLevelIslandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Level islands'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameLevelIslandImage',
              subtitle: 'Floating island map nodes (52)',
              body:
                  'Themed floating islands for a level map — empty / locked / '
                  'character / reward states across biomes (grass, desert, '
                  'ice, lava, mountain, cave, mine, cloud). Pass onTap to '
                  'select a node.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All islands',
              description: 'GameLevelIsland.values — 52 bundled nodes.',
              child: _IslandGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameLevelIslandImage(\n'
              '  island: GameLevelIsland.desertFox,\n'
              '  size: 140,\n'
              '  onTap: () {},\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _IslandGrid extends StatelessWidget {
  const _IslandGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameLevelIsland.values
          .map(
            (i) => SizedBox(
              width: 104,
              child: Column(
                children: [
                  GameLevelIslandImage(island: i, size: 92),
                  const SizedBox(height: 4),
                  Text(
                    i.name,
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
