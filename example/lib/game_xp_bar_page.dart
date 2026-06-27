import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameXpBar] examples.
class GameXpBarPage extends StatelessWidget {
  const GameXpBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameXpBar'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameXpBar',
              subtitle: 'Bundled empty frame + reveal-clipped fill',
              body:
                  'XP / progress bar composited from a bundled empty frame and '
                  'a filled track revealed left-to-right by progress (0..1). '
                  'The fill is clipped, not stretched, so the art keeps its '
                  'proportions. 5 GameXpBarStyle pairs.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All styles',
              description: 'GameXpBarStyle.values at 65% progress.',
              child: _StyleColumn(),
            ),
            const DocSection(
              title: 'Progress steps',
              description: 'The fire style at 0% / 33% / 66% / 100%.',
              child: _ProgressColumn(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameXpBar(\n'
              '  style: GameXpBarStyle.fire,\n'
              '  progress: 0.65,\n'
              '  width: 240,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _StyleColumn extends StatelessWidget {
  const _StyleColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: GameXpBarStyle.values
          .map(
            (s) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.name, style: DocTheme.caption),
                  const SizedBox(height: 4),
                  GameXpBar(style: s, progress: 0.65, width: 260),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ProgressColumn extends StatelessWidget {
  const _ProgressColumn();

  @override
  Widget build(BuildContext context) {
    const steps = [0.0, 0.33, 0.66, 1.0];
    return Column(
      children: steps
          .map(
            (p) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: GameXpBar(
                style: GameXpBarStyle.fire,
                progress: p,
                width: 260,
              ),
            ),
          )
          .toList(),
    );
  }
}
