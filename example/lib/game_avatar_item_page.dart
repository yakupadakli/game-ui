import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameAvatarItem] examples.
class GameAvatarItemPage extends StatefulWidget {
  const GameAvatarItemPage({super.key});

  @override
  State<GameAvatarItemPage> createState() => _GameAvatarItemPageState();
}

class _GameAvatarItemPageState extends State<GameAvatarItemPage> {
  GameMascot _picked = GameMascot.bear;

  static const _glow = <GameMascot, Color>{
    GameMascot.bear: GameColors.primary,
    GameMascot.elephant: GameColors.warning,
    GameMascot.fox: Color(0xFFFFC107),
    GameMascot.penguin: GameColors.success,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameAvatarItem'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameAvatarItem',
              subtitle: 'Selectable circular item with glow + check',
              body:
                  'Generic wrapper — pass any widget as the child (mascot, '
                  'icon, image). Adds a glow + check badge and scales up '
                  'when isSelected.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Pick a mascot',
              description:
                  'Tap to select. The active item glows and scales up.',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: GameMascot.values.map((m) {
                  return GameAvatarItem(
                    isSelected: _picked == m,
                    glowColor: _glow[m] ?? GameColors.primary,
                    onTap: () => setState(() => _picked = m),
                    child: GameMascotImage(
                      mascot: m,
                      pose: GameMascotPose.hero,
                      size: 96,
                    ),
                  );
                }).toList(),
              ),
            ),
            const DocSection(
              title: 'Static — no check badge',
              description: 'Pass showCheck: false to skip the bottom badge.',
              child: Center(
                child: GameAvatarItem(
                  isSelected: true,
                  showCheck: false,
                  glowColor: GameColors.accent,
                  onTap: _noop,
                  child: Icon(Icons.star, size: 72, color: Colors.amber),
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameAvatarItem(\n'
              '  isSelected: picked == GameMascot.fox,\n'
              '  glowColor: GameColors.warning,\n'
              '  onTap: () => setState(() => picked = GameMascot.fox),\n'
              '  child: GameMascotImage(\n'
              '    mascot: GameMascot.fox,\n'
              '    pose: GameMascotPose.hero,\n'
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
