import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTapScale] examples.
class GameTapScalePage extends StatefulWidget {
  const GameTapScalePage({super.key});

  @override
  State<GameTapScalePage> createState() => _GameTapScalePageState();
}

class _GameTapScalePageState extends State<GameTapScalePage> {
  int _taps = 0;
  int _longPresses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameTapScale'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameTapScale',
              subtitle: 'Press-down scale animation',
              body:
                  'Wraps a child with a tap-down scale. When `enabled` is '
                  'false the child is returned untouched (no GestureDetector). '
                  'Optional long-press keeps the scale held until release. '
                  '`enableFeedback` plays platform haptic / click on tap.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Default (scaleDown 0.95)',
              description: 'Tap the box — taps so far: $_taps.',
              child: Center(
                child: GameTapScale(
                  onTap: () => setState(() => _taps++),
                  child: _tile(GameColors.primary, 'Tap'),
                ),
              ),
            ),
            DocSection(
              title: 'Custom scaleDown (0.8) + faster duration',
              description: 'Bigger squish, snappier rebound.',
              child: Center(
                child: GameTapScale(
                  onTap: () {},
                  scaleDown: 0.8,
                  duration: const Duration(milliseconds: 60),
                  child: _tile(GameColors.accent, 'Press'),
                ),
              ),
            ),
            DocSection(
              title: 'With long-press',
              description:
                  'Long-press keeps the scale held. Long-presses so far: '
                  '$_longPresses.',
              child: Center(
                child: GameTapScale(
                  onTap: () {},
                  onLongPress: () => setState(() => _longPresses++),
                  child: _tile(GameColors.success, 'Hold me'),
                ),
              ),
            ),
            const DocSection(
              title: 'Disabled (no animation, no GestureDetector)',
              description:
                  'Child is returned as-is. Useful when state changes turn '
                  'a control off — the asset behind it does not rebuild.',
              child: Center(
                child: GameTapScale(enabled: false, child: _StaticTile()),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameTapScale(\n'
              '  onTap: handlePress,\n'
              '  scaleDown: 0.95,\n'
              '  child: myButtonBackground,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GameDesignTokens.spacingXL,
        vertical: GameDesignTokens.spacingMD,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(GameDesignTokens.radiusPill),
        boxShadow: GameShadows.button,
      ),
      child: Text(label, style: GameTextStyles.buttonLabel),
    );
  }
}

class _StaticTile extends StatelessWidget {
  const _StaticTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GameDesignTokens.spacingXL,
        vertical: GameDesignTokens.spacingMD,
      ),
      decoration: BoxDecoration(
        color: GameColors.disabled,
        borderRadius: BorderRadius.circular(GameDesignTokens.radiusPill),
      ),
      child: Text('Disabled', style: GameTextStyles.buttonLabel),
    );
  }
}
