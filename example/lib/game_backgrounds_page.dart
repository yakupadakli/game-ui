import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameBackground] examples.
class GameBackgroundsPage extends StatelessWidget {
  const GameBackgroundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Backgrounds'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameBackground',
              subtitle: 'Bundled full-screen background images',
              body:
                  '17 decorated backgrounds for scaffold bodies — generic '
                  'tones, a "congrats" confetti pattern, sky / cloud scenes, '
                  'and themed scenery (main menu, meadow, night sky, ocean). '
                  'Wrap a scaffold body with GameBackground or use the path '
                  'constants directly.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All bundled backgrounds',
              description:
                  '17 thumbnails — tap-friendly cards. Use BackgroundAssets '
                  'path constants to address them.',
              child: _BackgroundGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'Scaffold(\n'
              '  body: GameBackground(\n'
              '    asset: BackgroundAssets.bg2,\n'
              '    child: SafeArea(child: myContent),\n'
              '  ),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundGrid extends StatelessWidget {
  const _BackgroundGrid();

  static const List<(String, String)> _entries = [
    (BackgroundAssets.bg1, 'bg1'),
    (BackgroundAssets.bg2, 'bg2'),
    (BackgroundAssets.bg3, 'bg3'),
    (BackgroundAssets.bg4, 'bg4'),
    (BackgroundAssets.congrats, 'congrats'),
    (BackgroundAssets.stars, 'stars'),
    (BackgroundAssets.cloudsPortrait, 'cloudsPortrait'),
    (BackgroundAssets.skyLandscape, 'skyLandscape'),
    (BackgroundAssets.skyPortrait, 'skyPortrait'),
    (BackgroundAssets.skyClouds, 'skyClouds'),
    (BackgroundAssets.skyCloudsV2, 'skyCloudsV2'),
    (BackgroundAssets.skyMath, 'skyMath'),
    (BackgroundAssets.mainMenu, 'mainMenu'),
    (BackgroundAssets.meadowHills, 'meadowHills'),
    (BackgroundAssets.nightSkyMoon, 'nightSkyMoon'),
    (BackgroundAssets.nightSkyMoonV2, 'nightSkyMoonV2'),
    (BackgroundAssets.ocean, 'ocean'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: _entries
          .map(
            (e) => Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 140,
                    height: 200,
                    child: GameBackground(
                      asset: e.$1,
                      child: const SizedBox.shrink(),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(e.$2, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}
