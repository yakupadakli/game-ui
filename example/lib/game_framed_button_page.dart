import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameFramedButton] examples.
class GameFramedButtonPage extends StatelessWidget {
  const GameFramedButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Framed button'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: const DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DocIntro(
              title: 'GameFramedButton',
              subtitle: 'white frame · saturated blue · code-rendered',
              body:
                  'An independent square button matching the supplied visual. '
                  'The frame, gradient face, sheen, inset edge, and shadow are '
                  'drawn in Flutter, with no PNG asset.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Default',
              description: 'The child is optional and centered on the face.',
              child: Center(child: GameFramedButton()),
            ),
            DocSection(
              title: 'Content and sizes',
              description:
                  'Use the text or icon constructors for common content, or '
                  'child for custom layouts. All support the shared size scale.',
              child: _FramedButtonRow(),
            ),
            DocSection(
              title: 'Disabled',
              description: 'enabled: false dims the surface and blocks taps.',
              child: Center(
                child: GameFramedButton(
                  enabled: false,
                  child: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.white,
                    size: 44,
                  ),
                ),
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              "\n"
              "GameFramedButton(\n"
              "  onTap: handlePress,\n"
              "  child: const Icon(Icons.play_arrow_rounded),\n"
              ")\n"
              "\n"
              "GameFramedButton.text('Play', onTap: handlePress)\n"
              "\n"
              "GameFramedButton.icon(Icons.star, onTap: handlePress)",
            ),
          ],
        ),
      ),
    );
  }
}

class _FramedButtonRow extends StatelessWidget {
  const _FramedButtonRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        GameFramedButton.icon(
          Icons.play_arrow_rounded,
          size: GameButtonSize.medium,
          onTap: () {},
        ),
        GameFramedButton.text('5', size: GameButtonSize.medium, onTap: () {}),

        Divider(color: Colors.transparent, thickness: 0),
        GameFramedButton.icon(
          Icons.play_arrow_rounded,
          size: GameButtonSize.large,
          onTap: () {},
        ),
        GameFramedButton.text('5', size: GameButtonSize.large, onTap: () {}),

        Divider(color: Colors.transparent, thickness: 0),
        GameFramedButton.icon(
          Icons.play_arrow_rounded,
          size: GameButtonSize.xLarge,
          onTap: () {},
        ),
        GameFramedButton.text('5', size: GameButtonSize.xLarge, onTap: () {}),

        Divider(color: Colors.transparent, thickness: 0),
        GameFramedButton.icon(
          Icons.play_arrow_rounded,
          size: GameButtonSize.xxLarge,
          onTap: () {},
        ),
        GameFramedButton.text('5', size: GameButtonSize.xxLarge, onTap: () {}),
      ],
    );
  }
}
