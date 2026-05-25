import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameDesignTokens] + [GameShadows] examples.
class GameDesignTokensPage extends StatelessWidget {
  const GameDesignTokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Design tokens'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'Design tokens',
              subtitle: 'GameDesignTokens · GameShadows',
              body:
                  'Spacing scale, font size scale, border radius scale, tap '
                  'target sizes, and shadow elevations. Every widget pulls '
                  'from these so the package stays visually consistent.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'Spacing scale',
              description: 'XS · SM · MD · LG · XL · XXL (logical pixels).',
              child: _Spacing(),
            ),
            const DocSection(
              title: 'Font size scale',
              description: 'SM · MD · LG · XL · 2XL · 3XL.',
              child: _FontSizes(),
            ),
            const DocSection(
              title: 'Border radius',
              description: 'sm · md · lg · pill (full).',
              child: _RadiusScale(),
            ),
            const DocSection(
              title: 'Tap targets',
              description: 'Default 48 · Compact 32 (minimum hit area).',
              child: _TapTargets(),
            ),
            const DocSection(
              title: 'Shadows',
              description:
                  'Card uses 12 blur · 4 offset; button uses 8 blur · 4 '
                  'offset with stronger alpha for the lifted feel.',
              child: _Shadows(),
            ),
            const DocSection(
              title: 'Gradients',
              description:
                  'GameGradients.softBlue1/2/3 — pale to deep horizontal '
                  'sweeps for hero, header, and surface fills.',
              child: _Gradients(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Spacing extends StatelessWidget {
  const _Spacing();

  @override
  Widget build(BuildContext context) {
    const entries = [
      ('XS', GameDesignTokens.spacingXS),
      ('SM', GameDesignTokens.spacingSM),
      ('MD', GameDesignTokens.spacingMD),
      ('LG', GameDesignTokens.spacingLG),
      ('XL', GameDesignTokens.spacingXL),
      ('XXL', GameDesignTokens.spacingXXL),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  SizedBox(width: 48, child: Text(e.$1, style: DocTheme.body)),
                  Container(width: e.$2, height: 16, color: GameColors.primary),
                  const SizedBox(width: 12),
                  Text('${e.$2.toInt()}px', style: DocTheme.caption),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _FontSizes extends StatelessWidget {
  const _FontSizes();

  @override
  Widget build(BuildContext context) {
    const entries = [
      ('SM', GameDesignTokens.fontSM),
      ('MD', GameDesignTokens.fontMD),
      ('LG', GameDesignTokens.fontLG),
      ('XL', GameDesignTokens.fontXL),
      ('2XL', GameDesignTokens.font2XL),
      ('3XL', GameDesignTokens.font3XL),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  SizedBox(
                    width: 48,
                    child: Text(
                      '${e.$1} ${e.$2.toInt()}',
                      style: DocTheme.caption,
                    ),
                  ),
                  Text(
                    'Aa',
                    style: TextStyle(
                      fontFamily: GameDesignTokens.fontFamily,
                      fontSize: e.$2,
                      color: GameColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _RadiusScale extends StatelessWidget {
  const _RadiusScale();

  @override
  Widget build(BuildContext context) {
    const entries = [
      ('sm', GameDesignTokens.radiusSM),
      ('md', GameDesignTokens.radiusMD),
      ('lg', GameDesignTokens.radiusLG),
      ('pill', GameDesignTokens.radiusPill),
    ];
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: entries
          .map(
            (e) => Column(
              children: [
                Container(
                  width: 72,
                  height: 48,
                  decoration: BoxDecoration(
                    color: GameColors.primary,
                    borderRadius: BorderRadius.circular(e.$2),
                  ),
                ),
                const SizedBox(height: 6),
                Text(e.$1, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _TapTargets extends StatelessWidget {
  const _TapTargets();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Container(
              width: GameDesignTokens.tapTargetDefault,
              height: GameDesignTokens.tapTargetDefault,
              decoration: BoxDecoration(
                color: GameColors.accent,
                borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
              ),
            ),
            const SizedBox(height: 6),
            Text('Default · 48', style: DocTheme.caption),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            Container(
              width: GameDesignTokens.tapTargetCompact,
              height: GameDesignTokens.tapTargetCompact,
              decoration: BoxDecoration(
                color: GameColors.accent,
                borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
              ),
            ),
            const SizedBox(height: 6),
            Text('Compact · 32', style: DocTheme.caption),
          ],
        ),
      ],
    );
  }
}

class _Shadows extends StatelessWidget {
  const _Shadows();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: [
        _ShadowTile('card', GameShadows.card),
        _ShadowTile('button', GameShadows.button),
      ],
    );
  }
}

class _Gradients extends StatelessWidget {
  const _Gradients();

  @override
  Widget build(BuildContext context) {
    const entries = <(String, LinearGradient)>[
      ('softBlue1', GameGradients.softBlue1),
      ('softBlue2', GameGradients.softBlue2),
      ('softBlue3', GameGradients.softBlue3),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(
                height: 36,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  gradient: e.$2,
                  borderRadius: BorderRadius.circular(
                    GameDesignTokens.radiusSM,
                  ),
                ),
                child: Text(
                  e.$1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'BalooChettan2',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ShadowTile extends StatelessWidget {
  const _ShadowTile(this.label, this.shadow);

  final String label;
  final List<BoxShadow> shadow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 56,
          decoration: BoxDecoration(
            color: GameColors.surface,
            borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
            boxShadow: shadow,
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: DocTheme.caption),
      ],
    );
  }
}
