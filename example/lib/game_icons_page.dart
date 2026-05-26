import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameIconAssets] examples — bundled illustrated icon PNGs.
class GameIconsPage extends StatelessWidget {
  const GameIconsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Icons'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GameIconAssets',
              subtitle: 'Bundled illustrated icon PNGs',
              body:
                  'Chunky game-themed icons (check, lightbulb, pencil, etc.) '
                  'and generic UI icons (gear, lock, shield, speakers, stars). '
                  'Use Image.asset with the package scoped GameUiImage helper.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Game / lesson context',
              description: 'Game-themed glyphs for lesson cards and prompts.',
              child: _IconRow(
                entries: [
                  ('check', GameIconAssets.check),
                  ('lightbulb', GameIconAssets.lightbulb),
                  ('pencil', GameIconAssets.pencil),
                  ('puzzle', GameIconAssets.puzzle),
                  ('toyblocks', GameIconAssets.toyblocks),
                ],
              ),
            ),
            DocSection(
              title: 'System / UI',
              description: 'Generic system glyphs — settings, alerts, locked.',
              child: _IconRow(
                entries: [
                  ('bell', GameIconAssets.bell),
                  ('bulb', GameIconAssets.bulb),
                  ('gear', GameIconAssets.gearMetallic),
                  ('lock', GameIconAssets.lock),
                  ('palette', GameIconAssets.palettePaintbrush),
                  ('ribbon', GameIconAssets.ribbon),
                  ('shield', GameIconAssets.shield),
                ],
              ),
            ),
            DocSection(
              title: 'Audio',
              description: 'Speaker variants for volume sliders.',
              child: _IconRow(
                entries: [
                  ('v1', GameIconAssets.speakerV1),
                  ('v2', GameIconAssets.speakerV2),
                  ('v3', GameIconAssets.speakerV3),
                ],
              ),
            ),
            DocSection(
              title: 'Stars / trophies',
              description: 'For ratings, achievements, end-of-level summaries.',
              child: _IconRow(
                entries: [
                  ('star', GameIconAssets.star),
                  ('star_v1', GameIconAssets.starV1),
                  ('star_v2', GameIconAssets.starV2),
                  ('with_tail', GameIconAssets.starWithTail),
                  ('trophy', GameIconAssets.trophyWithStar),
                ],
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameUiImage.asset(\n'
              '  GameIconAssets.trophyWithStar,\n'
              '  width: 48,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _IconRow extends StatelessWidget {
  const _IconRow({required this.entries});

  final List<(String, String)> entries;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: entries
          .map(
            (e) => SizedBox(
              width: 80,
              child: Column(
                children: [
                  GameUiImage.asset(e.$2, width: 48, height: 48),
                  const SizedBox(height: 4),
                  Text(e.$1, style: DocTheme.caption),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
