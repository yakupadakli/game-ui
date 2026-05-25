import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameFeedbackOverlay] examples.
class GameFeedbackOverlayPage extends StatelessWidget {
  const GameFeedbackOverlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameFeedbackOverlay'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameFeedbackOverlay',
              subtitle: 'Bouncy correct / wrong feedback',
              body:
                  'A circle that bounces in (0 → 1.2 → 1.0 scale), holds for '
                  'a moment, then fades out. Inline as a widget or as a '
                  'full-screen Overlay via showGameFeedbackOverlay().',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Trigger full-screen overlay',
              description:
                  'Tap to show a centered overlay for ~600ms; the helper '
                  'inserts an OverlayEntry and removes it on completion.',
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledButton.tonal(
                      onPressed: () =>
                          showGameFeedbackOverlay(context, isCorrect: true),
                      child: const Text('SHOW CORRECT'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.tonal(
                      style: FilledButton.styleFrom(
                        backgroundColor: GameColors.danger.withValues(
                          alpha: 0.15,
                        ),
                        foregroundColor: GameColors.danger,
                      ),
                      onPressed: () =>
                          showGameFeedbackOverlay(context, isCorrect: false),
                      child: const Text('SHOW WRONG'),
                    ),
                  ],
                ),
              ),
            ),
            const DocSection(
              title: 'Inline (auto-replay)',
              description:
                  'The widget plays once on mount; rebuild to replay. Useful '
                  'when embedded above a question card.',
              child: Center(
                child: SizedBox(height: 140, child: _InlineReplay()),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'showGameFeedbackOverlay(context, isCorrect: true);\n'
              '\n'
              '// or embed inline:\n'
              'GameFeedbackOverlay(isCorrect: false)',
            ),
          ],
        ),
      ),
    );
  }
}

class _InlineReplay extends StatefulWidget {
  const _InlineReplay();

  @override
  State<_InlineReplay> createState() => _InlineReplayState();
}

class _InlineReplayState extends State<_InlineReplay> {
  bool _isCorrect = true;
  int _key = 0;

  void _replay() => setState(() => _key++);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 120,
          child: Center(
            child: GameFeedbackOverlay(
              key: ValueKey('$_isCorrect$_key'),
              isCorrect: _isCorrect,
              size: 80,
              iconSize: 50,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() => _isCorrect = true);
                _replay();
              },
              child: const Text('Correct'),
            ),
            TextButton(
              onPressed: () {
                setState(() => _isCorrect = false);
                _replay();
              },
              child: const Text('Wrong'),
            ),
          ],
        ),
      ],
    );
  }
}
