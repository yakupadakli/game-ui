import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameStreakImage] examples.
class GameStreaksPage extends StatelessWidget {
  const GameStreaksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Streaks'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameStreakImage',
              subtitle: 'Streak / combo HUD pieces (4)',
              body:
                  'Cloud platforms and a coin-fire badge that surface the '
                  'current streak. Pass a child to overlay the count, and '
                  'onTap to make it interactive.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All streak pieces',
              description: 'GameStreak.values — 4 bundled HUD pieces.',
              child: _StreakGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameStreakImage(\n'
              '  streak: GameStreak.coinFire,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _StreakGrid extends StatelessWidget {
  const _StreakGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameStreak.values
          .map(
            (s) => SizedBox(
              width: 120,
              child: Column(
                children: [
                  GameStreakImage(streak: s, size: 104),
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
