import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameSummaryRow] examples.
class GameSummaryRowPage extends StatelessWidget {
  const GameSummaryRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameSummaryRow'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameSummaryRow',
              subtitle: 'Bordered stat row',
              body:
                  'Distributes a fixed set of items evenly inside a '
                  'rounded bordered card. Pair it with GameStatItem widgets '
                  'to show level summaries, run results, or quick KPIs.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Basic — no title',
              description: 'Just three stat items in a row.',
              child: GameSummaryRow(
                items: const [
                  GameStatItem(
                    icon: Icons.timer_outlined,
                    value: '01:42',
                    label: 'Time',
                    color: GameColors.primary,
                  ),
                  GameStatItem(
                    icon: Icons.bolt_rounded,
                    value: '128',
                    label: 'XP',
                    color: GameColors.warning,
                  ),
                  GameStatItem(
                    icon: Icons.percent_rounded,
                    value: '92%',
                    label: 'Accuracy',
                    color: GameColors.success,
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'With title',
              description:
                  'Title appears centered above the row in a muted gray.',
              child: GameSummaryRow(
                title: 'Run Summary',
                items: const [
                  GameStatItem(
                    icon: Icons.emoji_events_rounded,
                    value: '3',
                    label: 'Wins',
                    color: GameColors.warning,
                  ),
                  GameStatItem(
                    icon: Icons.local_fire_department_rounded,
                    value: '7',
                    label: 'Streak',
                    color: GameColors.danger,
                  ),
                  GameStatItem(
                    icon: Icons.star_rounded,
                    value: '4.8',
                    label: 'Rating',
                    color: GameColors.accent,
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'Themed border',
              description:
                  'Customize backgroundColor / borderColor to match the '
                  'surrounding screen.',
              child: GameSummaryRow(
                title: 'Daily Goals',
                backgroundColor: const Color(0xFFFFF8E1),
                borderColor: GameColors.warning,
                items: const [
                  GameStatItem(
                    icon: Icons.check_circle,
                    value: '4/5',
                    label: 'Done',
                    color: GameColors.success,
                  ),
                  GameStatItem(
                    icon: Icons.diamond_rounded,
                    value: '210',
                    label: 'Gems',
                    color: GameColors.primary,
                  ),
                ],
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameSummaryRow(\n'
              "  title: 'Run Summary',\n"
              '  items: const [\n'
              '    GameStatItem(\n'
              '      icon: Icons.timer_outlined,\n'
              "      value: '01:42',\n"
              "      label: 'Time',\n"
              '      color: GameColors.primary,\n'
              '    ),\n'
              '    GameStatItem(\n'
              '      icon: Icons.bolt_rounded,\n'
              "      value: '128',\n"
              "      label: 'XP',\n"
              '      color: GameColors.warning,\n'
              '    ),\n'
              '  ],\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
