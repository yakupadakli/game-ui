import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTextStyles] examples.
class GameTextStylesPage extends StatelessWidget {
  const GameTextStylesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameTextStyles'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameTextStyles',
              subtitle: 'Bundled Fredoka · GameDesignTokens.fontFamily',
              body:
                  'Every style uses GameDesignTokens.fontFamily ("Fredoka"). '
                  'When the font file is not bundled, Flutter falls back to '
                  'the platform default — sizes and weights stay correct.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'Type scale (Fredoka)',
              description: 'heading1, heading2, body, bodyBold, buttonLabel.',
              child: _Scale(),
            ),
            const DocSection(
              title: 'BalooChettan2 comparison',
              description:
                  'Same sizes/weights rendered with the second bundled font '
                  'so you can compare letterforms.',
              child: _BalooComparison(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'Text("Hello", style: GameTextStyles.heading1)\n'
              '// override family inline:\n'
              'Text("Hi", style: GameTextStyles.heading2\n'
              "    .copyWith(fontFamily: 'BalooChettan2'))",
            ),
          ],
        ),
      ),
    );
  }
}

class _Scale extends StatelessWidget {
  const _Scale();

  @override
  Widget build(BuildContext context) {
    const sample = 'The quick brown fox';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _row('heading1', sample, GameTextStyles.heading1),
        _row('heading2', sample, GameTextStyles.heading2),
        _row('body', sample, GameTextStyles.body),
        _row('bodyBold', sample, GameTextStyles.bodyBold),
        _row(
          'buttonLabel',
          sample,
          GameTextStyles.buttonLabel.copyWith(color: GameColors.textPrimary),
        ),
      ],
    );
  }

  Widget _row(String name, String sample, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: DocTheme.caption),
          Text(sample, style: style),
        ],
      ),
    );
  }
}

class _BalooComparison extends StatelessWidget {
  const _BalooComparison();

  @override
  Widget build(BuildContext context) {
    const sample = 'The quick brown fox';
    final balooHeading = GameTextStyles.heading2.copyWith(
      fontFamily: 'BalooChettan2',
    );
    final balooBody = GameTextStyles.body.copyWith(fontFamily: 'BalooChettan2');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('heading2 — Fredoka', style: DocTheme.caption),
        Text(sample, style: GameTextStyles.heading2),
        const SizedBox(height: 8),
        Text('heading2 — BalooChettan2', style: DocTheme.caption),
        Text(sample, style: balooHeading),
        const SizedBox(height: 16),
        Text('body — Fredoka', style: DocTheme.caption),
        Text(sample, style: GameTextStyles.body),
        const SizedBox(height: 8),
        Text('body — BalooChettan2', style: DocTheme.caption),
        Text(sample, style: balooBody),
      ],
    );
  }
}
