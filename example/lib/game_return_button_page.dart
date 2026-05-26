import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameReturnButton] examples.
class GameReturnButtonPage extends StatelessWidget {
  const GameReturnButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameReturnButton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameReturnButton',
              subtitle: 'Square back button (GameButton.square wrapper)',
              body:
                  'Convenience widget — wraps GameButton.square with a '
                  'chevron-left icon. Use in app bars / headers as the back '
                  'navigation control.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Tap to pop',
              description:
                  'Default size 48. The button pops the route on tap; '
                  'override onTap for a custom action.',
              child: Center(
                child: GameReturnButton(onTap: () => Navigator.pop(context)),
              ),
            ),
            const DocSection(
              title: 'Sizes',
              description: '32 · 48 · 64',
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GameReturnButton(size: 32, onTap: _noop),
                    SizedBox(width: 16),
                    GameReturnButton(size: 48, onTap: _noop),
                    SizedBox(width: 16),
                    GameReturnButton(size: 64, onTap: _noop),
                  ],
                ),
              ),
            ),
            const DocSection(
              title: 'Disabled',
              description: 'Wrapped in GameDisabledOverlay.',
              child: Center(child: GameReturnButton(enabled: false)),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'AppBar(\n'
              '  leading: GameReturnButton(\n'
              '    onTap: () => Navigator.pop(context),\n'
              '  ),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

void _noop() {}
