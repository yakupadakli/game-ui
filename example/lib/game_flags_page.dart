import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameFlagImage] examples.
class GameFlagsPage extends StatelessWidget {
  const GameFlagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Flags'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameFlagImage',
              subtitle: 'Checkpoint / goal flags (4 tones)',
              body:
                  'Color flags for level maps and goal markers — blue, green, '
                  'pink, purple. Pass onTap for a tappable picker.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All flags',
              description: 'GameFlag.values — 4 color variants.',
              child: _FlagGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameFlagImage(\n'
              '  flag: GameFlag.green,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _FlagGrid extends StatelessWidget {
  const _FlagGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameFlag.values
          .map(
            (f) => Column(
              children: [
                GameFlagImage(flag: f, size: 90),
                const SizedBox(height: 4),
                Text(f.name, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}
