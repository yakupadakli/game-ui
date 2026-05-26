import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameResultCard] examples.
class GameResultCardPage extends StatelessWidget {
  const GameResultCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameResultCard'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GameResultCard',
              subtitle: 'End-of-level summary panel',
              body:
                  'Composable result card — stars float on the top edge, all '
                  'four interior slots (title, subtitle, badge, stats) are '
                  'optional. Wrap with GameScaffold + GameBackground for a '
                  'full win screen.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Full layout',
              description: '3 stars, score, EASY badge, stats row.',
              child: GameResultCard(
                starCount: 3,
                title: Text(
                  'You earned 3 stars!',
                  style: TextStyle(fontSize: 16, color: Color(0xFF5A6470)),
                ),
                subtitle: Text(
                  'Score: 240!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                badge: GameBadge(label: 'EASY', color: GameColors.success),
                stats: _StatsRow(correct: 12, wrong: 1, accuracyPercent: 92),
              ),
            ),
            DocSection(
              title: 'Mid score',
              description: '2 / 3 stars, no badge.',
              child: GameResultCard(
                starCount: 2,
                title: Text(
                  'Nice try!',
                  style: TextStyle(fontSize: 16, color: Color(0xFF5A6470)),
                ),
                subtitle: Text(
                  'Score: 120',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                stats: _StatsRow(correct: 7, wrong: 5, accuracyPercent: 58),
              ),
            ),
            DocSection(
              title: 'Minimal — stars + title only',
              description: 'Drop the slots you do not need.',
              child: GameResultCard(
                starCount: 1,
                title: Text(
                  'Keep practicing!',
                  style: TextStyle(fontSize: 16, color: Color(0xFF5A6470)),
                ),
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameResultCard(\n'
              '  starCount: 3,\n'
              "  title: Text('You earned 3 stars!'),\n"
              "  subtitle: Text('Score: 240'),\n"
              "  badge: GameBadge(label: 'EASY'),\n"
              '  stats: Row(\n'
              '    children: [\n'
              '      GameStatItem(icon: Icons.check_circle, value: ...),\n'
              '      GameStatItem(icon: Icons.cancel, value: ...),\n'
              '      GameStatItem(icon: Icons.percent, value: ...),\n'
              '    ],\n'
              '  ),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.correct,
    required this.wrong,
    required this.accuracyPercent,
  });

  final int correct;
  final int wrong;
  final int accuracyPercent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GameStatItem(
          icon: Icons.check_circle,
          value: '$correct',
          label: 'correct',
          color: GameColors.success,
        ),
        GameStatItem(
          icon: Icons.cancel,
          value: '$wrong',
          label: 'wrong',
          color: GameColors.danger,
        ),
        GameStatItem(
          icon: Icons.percent,
          value: '$accuracyPercent%',
          label: 'accuracy',
          color: GameColors.accent,
        ),
      ],
    );
  }
}
