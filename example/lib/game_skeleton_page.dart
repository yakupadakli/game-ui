import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameSkeleton] examples.
class GameSkeletonPage extends StatelessWidget {
  const GameSkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameSkeleton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameSkeleton',
              subtitle: 'Shimmering loading placeholder',
              body:
                  'A rounded rectangle whose highlight gradient sweeps left to '
                  'right while data loads. Compose multiple skeletons to mock '
                  'cards, lists, or article previews.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'Card mock',
              description: 'Avatar circle + two text lines, mid-load.',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GameSkeleton(width: 48, height: 48, borderRadius: 24),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GameSkeleton(height: 14, borderRadius: 6),
                        SizedBox(height: 8),
                        GameSkeleton(width: 160, height: 12, borderRadius: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'List rows',
              description: 'Three stacked rows with a wider line on top.',
              child: Column(
                children: [
                  GameSkeleton(height: 18, borderRadius: 8),
                  SizedBox(height: 10),
                  GameSkeleton(height: 14, borderRadius: 6),
                  SizedBox(height: 10),
                  GameSkeleton(width: 220, height: 14, borderRadius: 6),
                ],
              ),
            ),
            const DocSection(
              title: 'Colored variant',
              description: 'Customise base / highlight to match a card bg.',
              child: GameSkeleton(
                height: 80,
                borderRadius: 16,
                baseColor: Color(0xFFE3EEFD),
                highlightColor: Color(0xFFF4F8FF),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameSkeleton(\n'
              '  width: 200,\n'
              '  height: 16,\n'
              '  borderRadius: 8,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
