import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameBottomSheet] examples.
class GameBottomSheetPage extends StatelessWidget {
  const GameBottomSheetPage({super.key});

  void _showSimple(BuildContext context) {
    showGameBottomSheet<void>(
      context,
      child: const Text(
        'Are you sure you want to quit this level? Your progress will be lost.',
        style: TextStyle(fontSize: 14, color: Color(0xFF5A6470), height: 1.5),
      ),
      actions: [
        GameActionButton(
          label: 'CANCEL',
          color: GameColors.warning,
          onTap: () => Navigator.of(context).pop(),
        ),
        GameActionButton(
          label: 'QUIT',
          color: GameColors.danger,
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  void _showWithTitleAndList(BuildContext context) {
    showGameBottomSheet<void>(
      context,
      title: const Text('Choose difficulty'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DifficultyTile(
            label: 'Easy',
            description: '20 questions, no timer',
            color: GameColors.success,
            onTap: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: 8),
          _DifficultyTile(
            label: 'Normal',
            description: '20 questions, 30s each',
            color: GameColors.primary,
            onTap: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: 8),
          _DifficultyTile(
            label: 'Hard',
            description: '20 questions, 10s each',
            color: GameColors.danger,
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showWithActions(BuildContext context) {
    showGameBottomSheet<void>(
      context,
      title: const Text('Level complete!'),
      child: const Text(
        'You earned 3 stars and unlocked the next world. '
        'Keep going to beat the speed record!',
        style: TextStyle(fontSize: 14, color: Color(0xFF5A6470), height: 1.5),
      ),
      actions: [
        GameActionButton(
          label: 'REPLAY',
          color: GameColors.warning,
          onTap: () => Navigator.of(context).pop(),
        ),
        GameActionButton(
          label: 'NEXT',
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameBottomSheet'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameBottomSheet',
              subtitle: 'Chunky game-style modal sheet',
              body:
                  'Rounded top corners, drag handle, three optional slots '
                  '(title, child, actions). Use showGameBottomSheet() to '
                  'display it via the standard modal sheet flow.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Confirm sheet',
              description: 'Content + CANCEL / QUIT actions, no title.',
              child: Center(
                child: FilledButton.icon(
                  onPressed: () => _showSimple(context),
                  icon: const Icon(Icons.help_outline),
                  label: const Text('Show confirm sheet'),
                ),
              ),
            ),
            DocSection(
              title: 'With title and content list',
              description: 'Title + tappable rows inside the child slot.',
              child: Center(
                child: FilledButton.icon(
                  onPressed: () => _showWithTitleAndList(context),
                  icon: const Icon(Icons.tune),
                  label: const Text('Pick difficulty'),
                ),
              ),
            ),
            DocSection(
              title: 'With action buttons',
              description: 'Title + content + REPLAY / NEXT actions.',
              child: Center(
                child: FilledButton.icon(
                  onPressed: () => _showWithActions(context),
                  icon: const Icon(Icons.emoji_events_outlined),
                  label: const Text('Show result sheet'),
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'showGameBottomSheet<void>(\n'
              '  context,\n'
              "  title: Text('Level complete!'),\n"
              "  child: Text('You earned 3 stars.'),\n"
              '  actions: [\n'
              "    GameActionButton(label: 'REPLAY', onTap: ...),\n"
              "    GameActionButton(label: 'NEXT', onTap: ...),\n"
              '  ],\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _DifficultyTile extends StatelessWidget {
  const _DifficultyTile({
    required this.label,
    required this.description,
    required this.color,
    required this.onTap,
  });

  final String label;
  final String description;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.35)),
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5A6470),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
