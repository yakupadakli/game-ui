import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameIconButton] examples.
class GameIconButtonPage extends StatelessWidget {
  const GameIconButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameIconButton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameIconButton',
              subtitle: 'Nav buttons with code-drawn glyphs (14)',
              body:
                  'Home / book / settings / play buttons in color, outline, '
                  'and glossy treatments — every glyph is drawn in code. Just '
                  'pick a variant, size it, and pass onTap.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All variants',
              description: 'GameIconButtonVariant.values — 14 code variants.',
              child: _IconButtonGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameIconButton(\n'
              '  variant: GameIconButtonVariant.homeBlue,\n'
              '  size: 64,\n'
              '  onTap: () {},\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _IconButtonGrid extends StatelessWidget {
  const _IconButtonGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameIconButtonVariant.values
          .map(
            (v) => SizedBox(
              width: 96,
              child: Column(
                children: [
                  GameIconButton(variant: v, size: 64, onTap: () {}),
                  const SizedBox(height: 4),
                  Text(
                    v.name,
                    style: DocTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
