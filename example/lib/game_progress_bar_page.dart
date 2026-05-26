import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameProgressBar] examples.
class GameProgressBarPage extends StatefulWidget {
  const GameProgressBarPage({super.key});

  @override
  State<GameProgressBarPage> createState() => _GameProgressBarPageState();
}

class _GameProgressBarPageState extends State<GameProgressBarPage> {
  double _value = 0.35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameProgressBar'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameProgressBar',
              subtitle: 'Pill-shaped progress fill',
              body:
                  'Chunky outer rim + animated inner fill. Use for level '
                  'progress, XP, loading screens. Pass a label widget to '
                  'overlay text (e.g. percentage) on the track.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Interactive — drag to animate',
              description:
                  'The bar tweens to the new value over 250ms by default.',
              child: Column(
                children: [
                  GameProgressBar(value: _value),
                  const SizedBox(height: 12),
                  Slider(
                    value: _value,
                    onChanged: (v) => setState(() => _value = v),
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'With label overlay',
              description: 'Pass any Widget — typically a Text percentage.',
              child: GameProgressBar(
                value: 0.62,
                height: 32,
                label: Text(
                  '62%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const DocSection(
              title: 'Themed bars',
              description: 'Pick a fillColor + tweak height for variety.',
              child: Column(
                children: [
                  GameProgressBar(value: 0.85, fillColor: GameColors.success),
                  SizedBox(height: 12),
                  GameProgressBar(
                    value: 0.55,
                    fillColor: GameColors.warning,
                    height: 18,
                  ),
                  SizedBox(height: 12),
                  GameProgressBar(
                    value: 0.25,
                    fillColor: GameColors.danger,
                    height: 14,
                  ),
                ],
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameProgressBar(\n'
              '  value: xp / xpForNextLevel,\n'
              '  fillColor: GameColors.success,\n'
              "  label: Text('LVL 4'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
