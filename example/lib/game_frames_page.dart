import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameFrame] examples.
class GameFramesPage extends StatelessWidget {
  const GameFramesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Frames'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameFrame',
              subtitle: 'Colored frame panels (5 brand tones)',
              body:
                  'Rounded decorative frames — the PNG includes shape, rim '
                  'shading and outer glow, so the container doesn\'t need '
                  'its own border. Use for profile cards, dialog frames, '
                  'highlight badges.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All variants',
              description:
                  '5 colors: blue, green, orange, purple, yellow. Same '
                  'shape and rim style across the set.',
              child: _FrameGrid(),
            ),
            const DocSection(
              title: 'With content',
              description:
                  'Frame wraps any child — composes well with stroked text '
                  'and stat tiles.',
              child: _FrameWithContent(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameFrame(\n'
              '  variant: GameFrameVariant.orange,\n'
              '  child: GameStrokedTitle(\'Hello!\'),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _FrameGrid extends StatelessWidget {
  const _FrameGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameFrameVariant.values
          .map(
            (v) => Column(
              children: [
                GameFrame(
                  variant: v,
                  width: 120,
                  height: 90,
                  child: const SizedBox.shrink(),
                ),
                const SizedBox(height: 4),
                Text(v.name, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _FrameWithContent extends StatelessWidget {
  const _FrameWithContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GameFrame(
          variant: GameFrameVariant.purple,
          width: 280,
          padding: const EdgeInsets.all(20),
          child: GameStrokedTitle(
            'Math is Fun!',
            strokeColor: GameColors.accent,
          ),
        ),
        const SizedBox(height: 12),
        GameFrame(
          variant: GameFrameVariant.green,
          width: 280,
          padding: const EdgeInsets.all(16),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GameStatItem(
                icon: Icons.timer,
                value: '2:34',
                label: 'time',
                color: GameColors.success,
              ),
              GameStatItem(
                icon: Icons.percent,
                value: '94%',
                label: 'accuracy',
                color: GameColors.success,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
