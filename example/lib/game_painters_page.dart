import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameEllipsePainter] and [GameGlossPainter] examples.
class GamePaintersPage extends StatelessWidget {
  const GamePaintersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Painters'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'Custom painters',
              subtitle: 'GameEllipsePainter · GameGlossPainter',
              body:
                  'Small CustomPainter primitives for composing button '
                  'backgrounds. Use Ellipse for shadow blobs and pegs, '
                  'Gloss for the single-stroke highlight on rectangular '
                  'buttons.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'GameEllipsePainter',
              description: 'Solid-filled oval; sized by parent.',
              child: _EllipseRow(),
            ),
            DocSection(
              title: 'GameGlossPainter',
              description:
                  'Single curved stroke from lower-left to upper-right; '
                  'used as highlight on the upper-left corner of buttons.',
              child: _GlossRow(),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'CustomPaint(\n'
              '  size: Size(40, 16),\n'
              '  painter: GameEllipsePainter(color: GameColors.primary),\n'
              ')\n'
              '\n'
              'CustomPaint(\n'
              '  size: Size(20, 12),\n'
              '  painter: GameGlossPainter(color: Colors.white),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _EllipseRow extends StatelessWidget {
  const _EllipseRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: const [
        CustomPaint(
          size: Size(48, 18),
          painter: GameEllipsePainter(color: GameColors.primary),
        ),
        CustomPaint(
          size: Size(48, 18),
          painter: GameEllipsePainter(color: GameColors.success),
        ),
        CustomPaint(
          size: Size(48, 18),
          painter: GameEllipsePainter(color: GameColors.danger),
        ),
        CustomPaint(
          size: Size(64, 24),
          painter: GameEllipsePainter(color: GameColors.accent),
        ),
      ],
    );
  }
}

class _GlossRow extends StatelessWidget {
  const _GlossRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: const [
          CustomPaint(
            size: Size(20, 12),
            painter: GameGlossPainter(color: Colors.white, strokeWidth: 4),
          ),
          CustomPaint(
            size: Size(30, 18),
            painter: GameGlossPainter(color: Colors.white, strokeWidth: 5),
          ),
          CustomPaint(
            size: Size(40, 24),
            painter: GameGlossPainter(color: Colors.white, strokeWidth: 6),
          ),
        ],
      ),
    );
  }
}
