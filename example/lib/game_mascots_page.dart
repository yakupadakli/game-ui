import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameMascotImage] examples — 4 mascot families × 11 shared poses, plus
/// the bear-only extended [GameBearPose] set.
class GameMascotsPage extends StatefulWidget {
  const GameMascotsPage({super.key});

  @override
  State<GameMascotsPage> createState() => _GameMascotsPageState();
}

class _GameMascotsPageState extends State<GameMascotsPage> {
  GameMascot _activeMascot = GameMascot.bear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Mascots'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameMascotImage',
              subtitle: '4 mascot families · 11 shared poses · bear extras',
              body:
                  'Bundled animal characters (bear, elephant, fox, penguin) '
                  'in eleven matching poses. Pick a mascot below to browse '
                  'its full pose set, or use the static MascotAssets paths '
                  'directly with any Image widget. The bear family adds an '
                  'extended pose set via GameMascotImage.bear.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Mascot picker',
              description:
                  'Switching changes the grid below; helpful for comparing '
                  'pose consistency across characters.',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: GameMascot.values
                    .map(
                      (m) => ChoiceChip(
                        label: Text(m.name),
                        selected: _activeMascot == m,
                        onSelected: (_) => setState(() => _activeMascot = m),
                      ),
                    )
                    .toList(),
              ),
            ),
            DocSection(
              title: 'All poses for ${_activeMascot.name}',
              description:
                  '11 poses · same enum applies to every mascot family.',
              child: _PoseGrid(mascot: _activeMascot),
            ),
            const DocSection(
              title: 'Cross-mascot row — same pose',
              description:
                  'GameMascotPose.thinking rendered for all four families.',
              child: _CrossRow(pose: GameMascotPose.thinking),
            ),
            const DocSection(
              title: 'Hero pose',
              description: 'Larger format, useful for empty states / intros.',
              child: _CrossRow(pose: GameMascotPose.hero, size: 120),
            ),
            DocSection(
              title: 'Bear-only poses (${GameBearPose.values.length})',
              description:
                  'Bear has an extended pose set beyond the shared 11 — '
                  'render it with GameMascotImage.bear(pose: …). These exist '
                  'only for the bear family.',
              child: const _BearPoseGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameMascotImage(\n'
              '  mascot: GameMascot.fox,\n'
              '  pose: GameMascotPose.congrats,\n'
              '  size: 96,\n'
              ')\n'
              '\n'
              '// Bear-only extended poses:\n'
              'GameMascotImage.bear(\n'
              '  pose: GameBearPose.scientist,\n'
              '  size: 96,\n'
              ')\n'
              '\n'
              '// Or use a path directly:\n'
              'Image.asset(MascotAssets.bearHero, package: "game_ui")',
            ),
          ],
        ),
      ),
    );
  }
}

class _PoseGrid extends StatelessWidget {
  const _PoseGrid({required this.mascot});

  final GameMascot mascot;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: GameMascotPose.values
          .map(
            (p) => SizedBox(
              width: 88,
              child: Column(
                children: [
                  GameMascotImage(mascot: mascot, pose: p, size: 72),
                  const SizedBox(height: 4),
                  Text(p.name, style: DocTheme.caption),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _BearPoseGrid extends StatelessWidget {
  const _BearPoseGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: GameBearPose.values
          .map(
            (p) => SizedBox(
              width: 88,
              child: Column(
                children: [
                  GameMascotImage.bear(pose: p, size: 72),
                  const SizedBox(height: 4),
                  Text(p.name, style: DocTheme.caption),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _CrossRow extends StatelessWidget {
  const _CrossRow({required this.pose, this.size = 80});

  final GameMascotPose pose;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameMascot.values
          .map(
            (m) => Column(
              children: [
                GameMascotImage(mascot: m, pose: pose, size: size),
                const SizedBox(height: 4),
                Text(m.name, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}
