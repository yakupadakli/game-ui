import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameDoubleFramedButton] examples.
class GameDoubleFramedButtonPage extends StatelessWidget {
  const GameDoubleFramedButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Double-framed button'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DocIntro(
              title: 'GameDoubleFramedButton',
              subtitle: 'dark shell · white frame · inner ring',
              body:
                  'A separate code-rendered button matching the layered green '
                  'reference. It does not share its surface implementation '
                  'with GameFramedButton, so both can evolve independently.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Default',
              description: 'Green face with the reference frame colors.',
              child: Center(child: GameDoubleFramedButton()),
            ),
            DocSection(
              title: 'Text and icon',
              description: 'Convenience constructors keep content fitted.',
              child: _ContentRow(),
            ),
            DocSection(
              title: 'Colors',
              description:
                  'The face, outer shell, white frame, and inner ring can be '
                  'customized independently.',
              child: _ColorRow(),
            ),
            DocSection(
              title: 'Disabled',
              description: 'enabled: false dims the button and blocks taps.',
              child: Center(
                child: GameDoubleFramedButton.icon(
                  Icons.lock_outline_rounded,
                  enabled: false,
                ),
              ),
            ),
            DocCode(
              "GameDoubleFramedButton.text(\n"
              "  'Play',\n"
              "  onTap: handlePress,\n"
              ")\n"
              "\n"
              "GameDoubleFramedButton.icon(\n"
              "  Icons.star_rounded,\n"
              "  backgroundColor: GameColors.accent,\n"
              ")",
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentRow extends StatelessWidget {
  const _ContentRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        GameDoubleFramedButton.text('7', onTap: () {}),
        GameDoubleFramedButton.icon(Icons.play_arrow_rounded, onTap: () {}),
      ],
    );
  }
}

class _ColorRow extends StatelessWidget {
  const _ColorRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        GameDoubleFramedButton.icon(
          Icons.star_rounded,
          backgroundColor: GameColors.accent,
          onTap: () {},
        ),
        GameDoubleFramedButton.icon(
          Icons.favorite_rounded,
          backgroundColor: GameColors.danger,
          outerBorderColor: const Color(0xFF5C1831),
          onTap: () {},
        ),
      ],
    );
  }
}
