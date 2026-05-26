import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameDivider] examples.
class GameDividerPage extends StatelessWidget {
  const GameDividerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameDivider'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GameDivider',
              subtitle: 'Horizontal separator with optional centered widget',
              body:
                  'A simple horizontal line for separating sections. Drop in '
                  'an optional center widget — a label or icon — and the '
                  'divider splits in two with the widget inset between.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Plain',
              description: 'Default thickness and color.',
              child: GameDivider(),
            ),
            DocSection(
              title: 'With centered label',
              description:
                  'Pass any Widget via center — Text, Icon, or a chip.',
              child: GameDivider(
                center: Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8B95A5),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            DocSection(
              title: 'Themed — thicker, colored, with icon',
              description:
                  'Tweak thickness / color, indent / endIndent for inset '
                  'rules, and centerPadding for breathing room.',
              child: GameDivider(
                thickness: 3,
                color: GameColors.primary,
                indent: 16,
                endIndent: 16,
                centerPadding: 16,
                center: Icon(
                  Icons.star_rounded,
                  color: GameColors.warning,
                  size: 22,
                ),
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameDivider(\n'
              "  center: Text('OR'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
