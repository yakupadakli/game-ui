import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameStarRating] and [GameStatItem] examples.
class GameIndicatorsPage extends StatelessWidget {
  const GameIndicatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Indicators'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'Indicators',
              subtitle: 'GameStarRating · GameStatItem',
              body:
                  'Visual summaries — earned-out-of-total star rows and '
                  'icon+value+label stat stacks for end-of-level screens.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'GameStarRating — 0/3, 1/3, 2/3, 3/3',
              description: 'Default Material star, amber color.',
              child: _StarRatingRow(),
            ),
            DocSection(
              title: 'GameStarRating — 5-star scale',
              description: 'maxStars + size override.',
              child: Center(
                child: GameStarRating(starCount: 4, maxStars: 5, size: 28),
              ),
            ),
            DocSection(
              title: 'GameStatItem',
              description:
                  'Stack: icon + bold value + label. Use in summary rows.',
              child: _StatRow(),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameStarRating(starCount: 2, maxStars: 3)\n'
              'GameStatItem(\n'
              '  icon: Icons.timer,\n'
              "  value: '2:34',\n"
              "  label: 'time',\n"
              '  color: GameColors.primary,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _StarRatingRow extends StatelessWidget {
  const _StarRatingRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: GameStarRating(starCount: 0, size: 28),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: GameStarRating(starCount: 1, size: 28),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: GameStarRating(starCount: 2, size: 28),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: GameStarRating(starCount: 3, size: 28),
        ),
      ],
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        GameStatItem(
          icon: Icons.timer,
          value: '2:34',
          label: 'time',
          color: GameColors.primary,
        ),
        GameStatItem(
          icon: Icons.bolt,
          value: '12',
          label: 'streak',
          color: GameColors.warning,
        ),
        GameStatItem(
          icon: Icons.percent,
          value: '94%',
          label: 'accuracy',
          color: GameColors.success,
        ),
      ],
    );
  }
}
