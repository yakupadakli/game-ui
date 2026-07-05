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
                  'The thin outer outline, white frame, gradient face, sheen, '
                  'inset edge, and shadow are drawn in Flutter, with no PNG asset.',
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
              title: 'Wide rectangle',
              description:
                  'GameFramedWideButton keeps the same frame and face while '
                  'providing small, medium, large, and full-width sizes.',
              child: _FramedWideButtonColumn(),
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
              "GameFramedButton.icon(Icons.star, onTap: handlePress)\n"
              "\n"
              "GameFramedWideButton.text(\n"
              "  'Continue',\n"
              "  size: GameFramedWideButtonSize.full,\n"
              "  backgroundColor: GameColors.success,\n"
              "  onTap: handlePress,\n"
              ")",
            ),
          ],
        ),
      ),
    );
  }
}

class _FramedWideButtonColumn extends StatelessWidget {
  const _FramedWideButtonColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GameFramedWideButton.text(
          'Small',
          size: GameFramedWideButtonSize.small,
          backgroundColor: GameColors.success,
          onTap: () {},
        ),
        const SizedBox(height: 16),
        GameFramedWideButton.text(
          'Medium',
          size: GameFramedWideButtonSize.medium,
          backgroundColor: GameColors.primary,
          onTap: () {},
        ),
        const SizedBox(height: 16),
        GameFramedWideButton.text(
          'Large',
          size: GameFramedWideButtonSize.large,
          backgroundColor: GameColors.accent,
          onTap: () {},
        ),
        const SizedBox(height: 16),
        GameFramedWideButton.text(
          'Full width',
          size: GameFramedWideButtonSize.full,
          backgroundColor: GameColors.danger,
          onTap: () {},
        ),
      ],
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
