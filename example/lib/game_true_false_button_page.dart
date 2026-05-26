import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTrueFalseButton] examples.
class GameTrueFalseButtonPage extends StatefulWidget {
  const GameTrueFalseButtonPage({super.key});

  @override
  State<GameTrueFalseButtonPage> createState() =>
      _GameTrueFalseButtonPageState();
}

class _GameTrueFalseButtonPageState extends State<GameTrueFalseButtonPage> {
  bool? _picked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameTrueFalseButton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameTrueFalseButton',
              subtitle: 'Paired boolean answer buttons',
              body:
                  'Green when isTrue, red otherwise — chunky layered button '
                  'with check / cancel icon next to the label. Pass '
                  'isSelected to draw a thick outer ring matching the depth '
                  'palette (player\'s current pick).',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Try it — picked: ${_picked == null ? 'none' : _picked!}',
              description:
                  'Two buttons in a row; the selected one renders the thick '
                  'outer ring.',
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GameTrueFalseButton(
                      text: 'TRUE',
                      isTrue: true,
                      isSelected: _picked == true,
                      onTap: () => setState(() => _picked = true),
                    ),
                    const SizedBox(width: 12),
                    GameTrueFalseButton(
                      text: 'FALSE',
                      isTrue: false,
                      isSelected: _picked == false,
                      onTap: () => setState(() => _picked = false),
                    ),
                  ],
                ),
              ),
            ),
            const DocSection(
              title: 'Different copy',
              description: 'Text is free-form — use any short label.',
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GameTrueFalseButton(
                      text: 'YES',
                      isTrue: true,
                      onTap: _noop,
                    ),
                    SizedBox(width: 12),
                    GameTrueFalseButton(
                      text: 'NO',
                      isTrue: false,
                      onTap: _noop,
                    ),
                  ],
                ),
              ),
            ),
            const DocSection(
              title: 'Disabled',
              description: 'Wrapped in GameDisabledOverlay (opacity 0.38).',
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GameTrueFalseButton(
                      text: 'TRUE',
                      isTrue: true,
                      enabled: false,
                      onTap: _noop,
                    ),
                    SizedBox(width: 12),
                    GameTrueFalseButton(
                      text: 'FALSE',
                      isTrue: false,
                      enabled: false,
                      onTap: _noop,
                    ),
                  ],
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameTrueFalseButton(\n'
              "  text: 'TRUE',\n"
              '  isTrue: true,\n'
              '  isSelected: picked == true,\n'
              '  onTap: () => setState(() => picked = true),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

void _noop() {}
