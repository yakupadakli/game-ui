import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameDecorationImage] examples.
class GameDecorationsPage extends StatelessWidget {
  const GameDecorationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Decorations'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameDecorationImage',
              subtitle: 'Ambient scenery (clouds + flowers)',
              body:
                  'Scene dressing — clouds (plain, partly sunny, rain, soft '
                  'decoration) and flowers (blue, red, yellow). Excluded from '
                  'semantics by default; pass a semanticLabel to surface one.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All decorations',
              description: 'GameDecoration.values — 7 ambient pieces.',
              child: _DecorationGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameDecorationImage(\n'
              '  decoration: GameDecoration.cloudPartlySunny,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _DecorationGrid extends StatelessWidget {
  const _DecorationGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameDecoration.values
          .map(
            (d) => SizedBox(
              width: 96,
              child: Column(
                children: [
                  GameDecorationImage(decoration: d, size: 84),
                  const SizedBox(height: 4),
                  Text(
                    d.name,
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
