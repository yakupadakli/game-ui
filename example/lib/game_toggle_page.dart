import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameToggle] examples — default on/off, custom labels, custom active color,
/// sizes, and the disabled state.
class GameTogglePage extends StatefulWidget {
  const GameTogglePage({super.key});

  @override
  State<GameTogglePage> createState() => _GameTogglePageState();
}

class _GameTogglePageState extends State<GameTogglePage> {
  bool _sound = true;
  bool _answer = false;
  bool _power = true;
  bool _varLight = false;
  bool _varGrey = false;
  bool _notify = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Toggle'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameToggle',
              subtitle: 'glossy 3D on/off switch',
              body:
                  'A pill switch drawn entirely in code: a white shell, a '
                  'recessed track, and a candy-glossy knob that slides between '
                  'the on (left) and off (right) sides. Controlled like '
                  'Material Switch — pass value and handle onChanged.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Default',
              description:
                  'Tap to toggle. ON (green, left) / OFF (grey, '
                  'right).',
              child: Center(
                child: GameToggle(
                  value: _sound,
                  onChanged: (v) => setState(() => _sound = v),
                ),
              ),
            ),
            DocSection(
              title: 'Custom labels',
              description: 'Override onLabel / offLabel.',
              child: Center(
                child: GameToggle(
                  value: _answer,
                  onChanged: (v) => setState(() => _answer = v),
                  onLabel: 'YES',
                  offLabel: 'NO',
                ),
              ),
            ),
            DocSection(
              title: 'Long labels',
              description:
                  'Long onLabel / offLabel scale down to fit the knob and '
                  'track instead of overflowing.',
              child: Center(
                child: GameToggle(
                  value: _notify,
                  onChanged: (v) => setState(() => _notify = v),
                  onLabel: 'ENABLED',
                  offLabel: 'DISABLED',
                  width: 240,
                ),
              ),
            ),
            DocSection(
              title: 'Custom active color',
              description:
                  'Set the on-knob color via palette.copyWith(onColor:); its '
                  'gloss ramp derives from it.',
              child: Center(
                child: GameToggle(
                  value: _power,
                  onChanged: (v) => setState(() => _power = v),
                  palette: GameTogglePalette.light.copyWith(
                    onColor: GameColors.primary,
                  ),
                ),
              ),
            ),
            DocSection(
              title: 'Color variation',
              description:
                  'palette swaps the knob colors. light (default) is a white '
                  'off-knob with a dark label; grey is the earlier muted look. '
                  'Shown off so the knobs differ.',
              child: Column(
                children: [
                  GameToggle(
                    value: _varLight,
                    onChanged: (v) => setState(() => _varLight = v),
                  ),
                  const SizedBox(height: 16),
                  GameToggle(
                    value: _varGrey,
                    onChanged: (v) => setState(() => _varGrey = v),
                    palette: GameTogglePalette.grey,
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'Sizes',
              description:
                  'width controls the pill; everything scales from it.',
              child: Column(
                children: [
                  GameToggle(
                    value: _sound,
                    onChanged: (v) => setState(() => _sound = v),
                    width: 150,
                  ),
                  const SizedBox(height: 16),
                  GameToggle(
                    value: _sound,
                    onChanged: (v) => setState(() => _sound = v),
                    width: 220,
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Disabled',
              description:
                  'enabled: false (or onChanged: null) dims and '
                  'ignores taps.',
              child: Center(
                child: GameToggle(value: true, onChanged: null, enabled: false),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'bool soundOn = true;\n'
              '\n'
              'GameToggle(\n'
              '  value: soundOn,\n'
              '  onChanged: (v) => setState(() => soundOn = v),\n'
              ')\n'
              '\n'
              '// Custom labels / palette / size:\n'
              'GameToggle(\n'
              '  value: soundOn,\n'
              '  onChanged: (v) => setState(() => soundOn = v),\n'
              "  onLabel: 'YES',\n"
              "  offLabel: 'NO',\n"
              '  palette: GameTogglePalette.grey,\n'
              '  width: 220,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
