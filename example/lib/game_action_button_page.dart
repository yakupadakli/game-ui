import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameActionButton] and [GameActionGrid] examples.
class GameActionButtonPage extends StatelessWidget {
  const GameActionButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameActionButton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GameActionButton',
              subtitle: 'Wide labeled pill — primary action style',
              body:
                  'Outer white frame, colored inner face with stroked label '
                  'and a corner gloss highlight. Defaults to success green; '
                  'pass any color to retheme.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Default (success)',
              description: 'GameActionButton with default green palette.',
              child: Center(
                child: GameActionButton(label: 'NEXT', onTap: _noop),
              ),
            ),
            DocSection(
              title: 'Themed',
              description: 'Pass color to retheme — stroke / gloss are auto.',
              child: _ThemedRow(),
            ),
            DocSection(
              title: 'Disabled',
              description: 'enabled: false wraps in GameDisabledOverlay.',
              child: Center(
                child: GameActionButton(
                  label: 'SUBMIT',
                  onTap: _noop,
                  enabled: false,
                ),
              ),
            ),
            DocSection(
              title: 'GameActionGrid — 3 actions (2 + 1)',
              description: 'Auto-layout: 3 items render as 2 + 1.',
              child: GameActionGrid(
                actions: [
                  GameActionButton(
                    label: 'A',
                    onTap: _noop,
                    color: GameColors.primary,
                  ),
                  GameActionButton(
                    label: 'B',
                    onTap: _noop,
                    color: GameColors.warning,
                  ),
                  GameActionButton(
                    label: 'C',
                    onTap: _noop,
                    color: GameColors.danger,
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'GameActionGrid — 4 actions (2 + 2)',
              description: 'Auto-layout: 4 items render as 2 + 2.',
              child: GameActionGrid(
                actions: [
                  GameActionButton(label: 'ONE', onTap: _noop),
                  GameActionButton(label: 'TWO', onTap: _noop),
                  GameActionButton(label: 'THREE', onTap: _noop),
                  GameActionButton(label: 'FOUR', onTap: _noop),
                ],
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameActionButton(\n'
              "  label: 'NEXT',\n"
              '  onTap: onSubmit,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemedRow extends StatelessWidget {
  const _ThemedRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: const [
        GameActionButton(label: 'GO', onTap: _noop, color: GameColors.primary),
        GameActionButton(
          label: 'WAIT',
          onTap: _noop,
          color: GameColors.warning,
        ),
        GameActionButton(label: 'STOP', onTap: _noop, color: GameColors.danger),
        GameActionButton(label: 'PRO', onTap: _noop, color: GameColors.accent),
      ],
    );
  }
}

void _noop() {}
