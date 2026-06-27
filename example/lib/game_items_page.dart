import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameItemImage] examples.
class GameItemsPage extends StatelessWidget {
  const GameItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Items'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameItemImage',
              subtitle: 'Collectible item props (7 illustrations)',
              body:
                  'Props the player earns or interacts with — keys, a jar, '
                  'scrolls, a crystal, and a snowball. Pass onTap for a '
                  'tappable inventory tile.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All items',
              description: 'GameItem.values — 7 bundled props.',
              child: _ItemGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameItemImage(\n'
              '  item: GameItem.keyGold,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemGrid extends StatelessWidget {
  const _ItemGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameItem.values
          .map(
            (i) => SizedBox(
              width: 96,
              child: Column(
                children: [
                  GameItemImage(item: i, size: 84),
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
