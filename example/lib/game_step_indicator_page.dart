import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameStepIndicator] examples.
class GameStepIndicatorPage extends StatefulWidget {
  const GameStepIndicatorPage({super.key});

  @override
  State<GameStepIndicatorPage> createState() => _GameStepIndicatorPageState();
}

class _GameStepIndicatorPageState extends State<GameStepIndicatorPage> {
  static const int _liveCount = 4;
  int _liveIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameStepIndicator'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameStepIndicator',
              subtitle: 'Numbered dots + connecting lines',
              body:
                  'Use for multi-step flows (onboarding, checkout, quiz '
                  'wizard). Completed steps fill with the success color and a '
                  'check; the active dot uses the primary color; future dots '
                  'stay muted.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Live demo — slide to advance',
              description:
                  'Drag the slider to move the current step from 0 to '
                  '${_liveCount - 1}.',
              child: Column(
                children: [
                  GameStepIndicator(
                    count: _liveCount,
                    currentIndex: _liveIndex,
                  ),
                  const SizedBox(height: 20),
                  Slider(
                    value: _liveIndex.toDouble(),
                    min: 0,
                    max: (_liveCount - 1).toDouble(),
                    divisions: _liveCount - 1,
                    label: 'Step ${_liveIndex + 1}',
                    onChanged: (v) => setState(() => _liveIndex = v.round()),
                  ),
                  Text(
                    'Current step: ${_liveIndex + 1} / $_liveCount',
                    style: DocTheme.caption,
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Static 5-step at index 3',
              description: 'Three completed, one active, one pending.',
              child: GameStepIndicator(count: 5, currentIndex: 3),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameStepIndicator(\n'
              '  count: 4,\n'
              '  currentIndex: step,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
