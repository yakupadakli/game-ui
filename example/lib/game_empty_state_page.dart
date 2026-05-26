import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameEmptyState] examples.
class GameEmptyStatePage extends StatelessWidget {
  const GameEmptyStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameEmptyState'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameEmptyState',
              subtitle: 'Vertical empty-list placeholder',
              body:
                  'Optional illustration (mascot, icon, image) on top, a '
                  'required title, optional message, and optional action '
                  'button. Use as the empty state for any list/grid.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'Mascot + title + message',
              description:
                  'Full layout — pose: thinking matches "no data yet".',
              child: GameEmptyState(
                illustration: GameMascotImage(
                  mascot: GameMascot.penguin,
                  pose: GameMascotPose.thinking,
                  size: 140,
                ),
                title: 'No badges yet',
                message:
                    'Complete levels to earn your first badge. Tap below to '
                    'start a quick practice round.',
              ),
            ),
            DocSection(
              title: 'With action',
              description: 'Add a GameActionButton or any widget as action.',
              child: GameEmptyState(
                illustration: const GameMascotImage(
                  mascot: GameMascot.fox,
                  pose: GameMascotPose.pointing,
                  size: 140,
                ),
                title: 'No friends added',
                message: 'Invite a friend to start a duel.',
                action: GameActionButton(label: 'INVITE', onTap: () {}),
              ),
            ),
            const DocSection(
              title: 'Icon variant',
              description: 'Drop the mascot — any widget works.',
              child: GameEmptyState(
                illustration: Icon(
                  Icons.inbox_outlined,
                  size: 80,
                  color: Color(0xFFB7C8D9),
                ),
                title: 'Inbox is empty',
                message: 'You will see messages from your friends here.',
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameEmptyState(\n'
              '  illustration: GameMascotImage(\n'
              '    mascot: GameMascot.penguin,\n'
              '    pose: GameMascotPose.thinking,\n'
              '  ),\n'
              "  title: 'No badges yet',\n"
              "  message: 'Complete levels to earn one.',\n"
              "  action: GameActionButton(label: 'PLAY', onTap: ...),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
