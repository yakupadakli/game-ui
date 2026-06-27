import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameImageButton] examples.
class GameImageButtonPage extends StatelessWidget {
  const GameImageButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameImageButton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameImageButton',
              subtitle: 'PNG-backed button + optional centered child',
              body:
                  'Tappable button drawn from a bundled button PNG (rect '
                  'colors, glossy circle/square, orange pill, white outline). '
                  'Drop a label or icon in child; press feedback via '
                  'GameTapScale.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'With a label',
              description: 'Rect color buttons carrying a centered label.',
              child: _LabeledButtons(),
            ),
            const DocSection(
              title: 'All styles',
              description: 'GameImageButtonStyle.values — 14 bundled bases.',
              child: _StyleGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameImageButton(\n'
              '  style: GameImageButtonStyle.green,\n'
              '  width: 160,\n'
              '  onTap: () {},\n'
              "  child: const Text('PLAY'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _LabeledButtons extends StatelessWidget {
  const _LabeledButtons();

  static const List<(GameImageButtonStyle, String)> _items = [
    (GameImageButtonStyle.blue, 'START'),
    (GameImageButtonStyle.green, 'PLAY'),
    (GameImageButtonStyle.purple, 'NEXT'),
    (GameImageButtonStyle.red, 'STOP'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: _items
          .map(
            (e) => GameImageButton(
              style: e.$1,
              width: 150,
              onTap: () {},
              child: Text(
                e.$2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _StyleGrid extends StatelessWidget {
  const _StyleGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameImageButtonStyle.values
          .map(
            (s) => SizedBox(
              width: 104,
              child: Column(
                children: [
                  GameImageButton(style: s, height: 60, onTap: () {}),
                  const SizedBox(height: 4),
                  Text(
                    s.name,
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
