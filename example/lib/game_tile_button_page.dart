import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTileButton] examples — the base glossy tile chrome driven by a single
/// color, with an arbitrary [child]: any color, sizes, custom content, and the
/// disabled state.
class GameTileButtonPage extends StatelessWidget {
  const GameTileButtonPage({super.key});

  static const _palette = <(String, Color)>[
    ('success', GameColors.success),
    ('warning', GameColors.warning),
    ('danger', GameColors.danger),
    ('primary', GameColors.primary),
    ('accent', GameColors.accent),
    ('orange', GameColors.elephantOrange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Tile button'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameTileButton',
              subtitle: 'glossy plastic tile · any color · any child',
              body:
                  'The base glossy tile, drawn entirely in code from a single '
                  'color: a white frame with a drop shadow, a body→lip '
                  'gradient, a bright top rim, a crisp inset edge, and a corner '
                  'highlight. The rim, lip and edge are all derived from the '
                  'color, so any color works. child is centered on the face. '
                  'GameDifficultyButton is a preset built on top of it.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Any color',
              description:
                  'Pass any color; the gloss shades derive from it. child '
                  'overlays the face.',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: _palette
                    .map(
                      (e) => GameTileButton(
                        color: e.$2,
                        onTap: () {},
                        child: const Icon(
                          Icons.star_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            DocSection(
              title: 'Sizes',
              description:
                  'The full shared GameButtonSize scale: xSmall · small · '
                  'medium · large · xLarge · xxLarge.',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children:
                    const [
                          GameButtonSize.xSmall,
                          GameButtonSize.small,
                          GameButtonSize.medium,
                          GameButtonSize.large,
                          GameButtonSize.xLarge,
                          GameButtonSize.xxLarge,
                        ]
                        .map(
                          (s) => GameTileButton(
                            color: GameColors.primary,
                            size: s,
                            onTap: () {},
                            child: Icon(
                              Icons.bolt,
                              color: Colors.white,
                              size: s * 0.36,
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            DocSection(
              title: 'Custom content',
              description:
                  'Any widget works as the child — text, numbers, '
                  'icons.',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  GameTileButton(
                    color: GameColors.accent,
                    onTap: () {},
                    child: const Text(
                      '7',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  GameTileButton(
                    color: GameColors.success,
                    onTap: () {},
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        Text(
                          'PLAY',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const GameTileButton(
                    color: GameColors.warning,
                    child: Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Disabled',
              description: 'enabled: false dims the tile and ignores taps.',
              child: Center(
                child: GameTileButton(
                  color: GameColors.danger,
                  enabled: false,
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameTileButton(\n'
              '  color: GameColors.success,\n'
              '  onTap: () {},\n'
              '  child: const Icon(Icons.star_rounded, color: Colors.white),\n'
              ')\n'
              '\n'
              '// Sized (shared scale):\n'
              'GameTileButton(\n'
              '  color: GameColors.primary,\n'
              '  size: GameButtonSize.xLarge,\n'
              "  child: const Text('7'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
