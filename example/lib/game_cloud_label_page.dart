import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameCloudLabel] examples.
class GameCloudLabelPage extends StatelessWidget {
  const GameCloudLabelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameCloudLabel'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameCloudLabel',
              subtitle: 'Cloud-shaped label plate (2 tones)',
              body:
                  'A soft cloud plate sized to wrap a short caption (level '
                  'name, prompt). Pass onTap to make it a tappable button.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'Variants',
              description: 'GameCloudLabelVariant.cloud and .green.',
              child: _CloudGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameCloudLabel(\n'
              '  variant: GameCloudLabelVariant.green,\n'
              '  width: 200,\n'
              "  child: const Text('Level 1'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _CloudGrid extends StatelessWidget {
  const _CloudGrid();

  static const List<(GameCloudLabelVariant, String)> _items = [
    (GameCloudLabelVariant.cloud, 'Level 1'),
    (GameCloudLabelVariant.green, 'Bonus'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: _items
          .map(
            (e) => GameCloudLabel(
              variant: e.$1,
              width: 200,
              onTap: () {},
              child: Text(
                e.$2,
                style: const TextStyle(
                  color: Color(0xFF3A2E1A),
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
