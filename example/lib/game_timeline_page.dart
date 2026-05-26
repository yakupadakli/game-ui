import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTimeline] examples.
class GameTimelinePage extends StatelessWidget {
  const GameTimelinePage({super.key});

  Widget _entryText(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 2),
        Text(subtitle, style: DocTheme.caption),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameTimeline'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameTimeline',
              subtitle: 'Vertical progress trail',
              body:
                  'Render an ordered list of milestones with colored dots and '
                  'a connecting rail. Mark entries as completed to show a '
                  'check; pass an icon for in-progress states.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Level progress',
              description: 'Mixed completed and pending milestones.',
              child: GameTimeline(
                entries: [
                  GameTimelineEntry(
                    color: GameColors.success,
                    completed: true,
                    child: _entryText(
                      'Started level',
                      'Spawned at the village gate',
                    ),
                  ),
                  GameTimelineEntry(
                    color: GameColors.primary,
                    completed: true,
                    child: _entryText('Beat boss', 'Defeated the forest troll'),
                  ),
                  GameTimelineEntry(
                    color: GameColors.warning,
                    icon: Icons.star,
                    child: _entryText(
                      'Won 3 stars',
                      'Score above 9,000 unlocks bonus stars',
                    ),
                  ),
                  GameTimelineEntry(
                    color: GameColors.accent,
                    icon: Icons.emoji_events,
                    child: _entryText(
                      'Earned badge',
                      'Trail Hero badge dropped in inventory',
                    ),
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'Compact rail',
              description: 'Tighter dots, custom line color.',
              child: GameTimeline(
                dotSize: 16,
                spacing: 10,
                lineColor: const Color(0xFFD8DEE6),
                entries: [
                  GameTimelineEntry(
                    color: GameColors.primary,
                    completed: true,
                    child: _entryText('Order placed', 'Just now'),
                  ),
                  GameTimelineEntry(
                    color: GameColors.primary,
                    completed: true,
                    child: _entryText('Packed', '12 min ago'),
                  ),
                  GameTimelineEntry(
                    color: GameColors.warning,
                    icon: Icons.local_shipping,
                    child: _entryText('Out for delivery', 'ETA 18:30'),
                  ),
                ],
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameTimeline(\n'
              '  entries: [\n'
              '    GameTimelineEntry(\n'
              '      color: GameColors.success,\n'
              '      completed: true,\n'
              '      child: Text(\'Started level\'),\n'
              '    ),\n'
              '    GameTimelineEntry(\n'
              '      color: GameColors.warning,\n'
              '      icon: Icons.star,\n'
              '      child: Text(\'Won 3 stars\'),\n'
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
