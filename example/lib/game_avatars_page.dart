import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameAvatarImage] examples.
class GameAvatarsPage extends StatelessWidget {
  const GameAvatarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Avatars'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameAvatarImage',
              subtitle: 'Bundled avatar faces',
              body:
                  'Round character portraits for profile pickers. Render '
                  'directly, or compose inside GameAvatarItem for a selectable '
                  'picker with glow + check badge.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'Bundled faces',
              description: 'GameAvatar.values — boy + girl portraits.',
              child: _AvatarGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameAvatarImage(\n'
              '  avatar: GameAvatar.faceGirl,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarGrid extends StatelessWidget {
  const _AvatarGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameAvatar.values
          .map(
            (a) => Column(
              children: [
                GameAvatarImage(avatar: a, size: 110),
                const SizedBox(height: 4),
                Text(a.name, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}
