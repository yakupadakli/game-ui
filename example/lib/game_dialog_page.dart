import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameDialog] examples.
class GameDialogPage extends StatelessWidget {
  const GameDialogPage({super.key});

  void _showSimple(BuildContext context) {
    showGameDialog<void>(
      context,
      title: const Text(
        'Are you sure?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
      content: const Text(
        'You will lose your current progress.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Color(0xFF5A6470)),
      ),
      actions: [
        GameActionButton(
          label: 'CANCEL',
          color: GameColors.warning,
          onTap: () => Navigator.of(context).pop(),
        ),
        GameActionButton(
          label: 'YES',
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  void _showResult(BuildContext context) {
    showGameDialog<void>(
      context,
      title: const Text(
        'Level Complete!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
      content: const GameStarRating(starCount: 2, maxStars: 3, size: 48),
      actions: [
        GameActionButton(
          label: 'NEXT',
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  void _showWithMascot(BuildContext context) {
    showGameDialog<void>(
      context,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          GameMascotImage(
            mascot: GameMascot.fox,
            pose: GameMascotPose.congrats,
            size: 140,
          ),
          SizedBox(height: 8),
          Text(
            'Great job!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      actions: [
        GameActionButton(label: 'OK', onTap: () => Navigator.of(context).pop()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameDialog'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameDialog',
              subtitle: 'Chunky game-style modal',
              body:
                  'Thick rim, drop shadow, three optional slots (title, '
                  'content, actions). Use showGameDialog() or push manually.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Confirm prompt',
              description: 'Title + content + CANCEL / YES actions.',
              child: Center(
                child: FilledButton.icon(
                  onPressed: () => _showSimple(context),
                  icon: const Icon(Icons.help_outline),
                  label: const Text('Show confirm dialog'),
                ),
              ),
            ),
            DocSection(
              title: 'Result panel',
              description: 'Star rating in the content slot.',
              child: Center(
                child: FilledButton.icon(
                  onPressed: () => _showResult(context),
                  icon: const Icon(Icons.emoji_events_outlined),
                  label: const Text('Show result dialog'),
                ),
              ),
            ),
            DocSection(
              title: 'With mascot',
              description: 'Mascot inside the content slot for celebrations.',
              child: Center(
                child: FilledButton.icon(
                  onPressed: () => _showWithMascot(context),
                  icon: const Icon(Icons.celebration_outlined),
                  label: const Text('Show mascot dialog'),
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'showGameDialog<void>(\n'
              '  context,\n'
              "  title: Text('Are you sure?'),\n"
              "  content: Text('You will lose progress.'),\n"
              '  actions: [\n'
              "    GameActionButton(label: 'CANCEL', onTap: ...),\n"
              "    GameActionButton(label: 'YES', onTap: ...),\n"
              '  ],\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
