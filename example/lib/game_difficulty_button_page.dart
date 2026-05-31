import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameDifficultyButton] examples — easy / medium / hard presets, sizes,
/// disabled state, and custom color.
class GameDifficultyButtonPage extends StatelessWidget {
  const GameDifficultyButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Difficulty button'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameDifficultyButton',
              subtitle: 'easy · medium · hard',
              body:
                  'Glossy rounded-square tile with a pale outer frame, a '
                  'colored gradient face, a corner gloss, an image placeholder '
                  'icon, and a stroked label. The difficulty picks the preset '
                  'palette and label.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Presets',
              description: 'The three built-in levels.',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: GameDifficulty.values
                    .map(
                      (d) => GameDifficultyButton(difficulty: d, onTap: () {}),
                    )
                    .toList(),
              ),
            ),
            DocSection(
              title: 'Sizes',
              description: 'sm · md · lg (size also accepts any number).',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: const [
                  GameDifficultyButton(
                    difficulty: GameDifficulty.easy,
                    size: GameDifficultyButtonSize.sm,
                  ),
                  GameDifficultyButton(
                    difficulty: GameDifficulty.easy,
                    size: GameDifficultyButtonSize.md,
                  ),
                  GameDifficultyButton(
                    difficulty: GameDifficulty.easy,
                    size: GameDifficultyButtonSize.lg,
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Custom label & color',
              description: 'Override the preset label and face color.',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  GameDifficultyButton(
                    difficulty: GameDifficulty.easy,
                    label: 'Pro',
                    color: GameColors.accent,
                  ),
                  GameDifficultyButton(
                    difficulty: GameDifficulty.medium,
                    label: 'Expert',
                    color: GameColors.primary,
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Disabled',
              description: 'enabled: false dims the tile and ignores taps.',
              child: Center(
                child: GameDifficultyButton(
                  difficulty: GameDifficulty.hard,
                  enabled: false,
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameDifficultyButton(\n'
              '  difficulty: GameDifficulty.easy,\n'
              '  onTap: () {},\n'
              ')\n'
              '\n'
              '// Override label / color / size:\n'
              'GameDifficultyButton(\n'
              '  difficulty: GameDifficulty.hard,\n'
              "  label: 'Boss',\n"
              '  color: GameColors.accent,\n'
              '  size: GameDifficultyButtonSize.lg,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
