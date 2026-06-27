import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameCharacterImage] examples.
class GameCharactersPage extends StatelessWidget {
  const GameCharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameCharacterImage',
              subtitle: 'Full-body scene characters (20 illustrations)',
              body:
                  'Hero illustrations and level guides — astronauts, animals, '
                  'and the fire mascot. Pick a GameCharacter and size it; pass '
                  'onTap to make it a tappable picker item.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All characters',
              description: 'GameCharacter.values — 20 bundled illustrations.',
              child: _CharacterGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameCharacterImage(\n'
              '  character: GameCharacter.astronaut,\n'
              '  size: 120,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterGrid extends StatelessWidget {
  const _CharacterGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameCharacter.values
          .map(
            (c) => SizedBox(
              width: 96,
              child: Column(
                children: [
                  GameCharacterImage(character: c, size: 84),
                  const SizedBox(height: 4),
                  Text(
                    c.name,
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
