import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameLevelPlatformImage] examples.
class GameLevelPlatformsPage extends StatelessWidget {
  const GameLevelPlatformsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Level platforms'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameLevelPlatformImage',
              subtitle: 'Grounded biome platforms (21)',
              body:
                  'Grounded biome platforms for a level map — desert, ice, '
                  'jungle, meadow, moon, volcano — in empty / locked / '
                  'character / trophy / streak states. Pass onTap to select a '
                  'node.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All platforms',
              description: 'GameLevelPlatform.values — 21 bundled nodes.',
              child: _PlatformGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameLevelPlatformImage(\n'
              '  platform: GameLevelPlatform.meadowAstronaut,\n'
              '  size: 160,\n'
              '  onTap: () {},\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformGrid extends StatelessWidget {
  const _PlatformGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameLevelPlatform.values
          .map(
            (p) => SizedBox(
              width: 120,
              child: Column(
                children: [
                  GameLevelPlatformImage(platform: p, size: 108),
                  const SizedBox(height: 4),
                  Text(
                    p.name,
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
