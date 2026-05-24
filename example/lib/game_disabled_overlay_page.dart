import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameDisabledOverlay] examples.
class GameDisabledOverlayPage extends StatefulWidget {
  const GameDisabledOverlayPage({super.key});

  @override
  State<GameDisabledOverlayPage> createState() =>
      _GameDisabledOverlayPageState();
}

class _GameDisabledOverlayPageState extends State<GameDisabledOverlayPage> {
  bool _disabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameDisabledOverlay'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameDisabledOverlay',
              subtitle: 'Opacity(0.38) when disabled · Material guideline',
              body:
                  'Wraps any child in Opacity(0.38) when `disabled` is true. '
                  'Returns the child untouched otherwise — no Opacity layer, '
                  'no rebuild of the underlying asset.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Toggle',
              description:
                  'Flip the switch to see the overlay applied to three '
                  'different children.',
              child: Column(
                children: [
                  Row(
                    children: [
                      Switch(
                        value: _disabled,
                        onChanged: (v) => setState(() => _disabled = v),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _disabled ? 'disabled (opacity 0.38)' : 'enabled',
                        style: DocTheme.body,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 24,
                    runSpacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      GameDisabledOverlay(
                        disabled: _disabled,
                        child: _pill(GameColors.primary, 'Primary'),
                      ),
                      GameDisabledOverlay(
                        disabled: _disabled,
                        child: _pill(GameColors.success, 'Success'),
                      ),
                      GameDisabledOverlay(
                        disabled: _disabled,
                        child: _circle(GameColors.danger),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Side-by-side',
              description: 'Same widget, both states for direct comparison.',
              child: _SideBySide(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameDisabledOverlay(\n'
              '  disabled: !widget.enabled,\n'
              '  child: const MyAssetButton(),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }

  Widget _pill(Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GameDesignTokens.spacingLG,
        vertical: GameDesignTokens.spacingSM,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(GameDesignTokens.radiusPill),
      ),
      child: Text(
        label,
        style: GameTextStyles.buttonLabel.copyWith(
          fontSize: GameDesignTokens.fontLG,
        ),
      ),
    );
  }

  Widget _circle(Color color) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _SideBySide extends StatelessWidget {
  const _SideBySide();

  @override
  Widget build(BuildContext context) {
    Widget tile() => Container(
      width: 96,
      height: 56,
      decoration: BoxDecoration(
        color: GameColors.primary,
        borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            GameDisabledOverlay(disabled: false, child: tile()),
            const SizedBox(height: 6),
            Text('enabled', style: DocTheme.caption),
          ],
        ),
        Column(
          children: [
            GameDisabledOverlay(disabled: true, child: tile()),
            const SizedBox(height: 6),
            Text('disabled', style: DocTheme.caption),
          ],
        ),
      ],
    );
  }
}
