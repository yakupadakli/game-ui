import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameColors] examples.
class GameColorsPage extends StatelessWidget {
  const GameColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameColors'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameColors',
              subtitle: 'Brand palette · semantic aliases · neutrals',
              body:
                  'Five brand colors carry the descriptive name from the design '
                  'guide. Semantic aliases (primary, success, warning, danger, '
                  'accent) point at the same values so widgets can opt in to '
                  'whichever vocabulary fits best.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'Brand palette',
              description:
                  'Use these names when the visual identity is meaningful '
                  '(e.g. "Sunny Yellow XP badge").',
              child: _BrandPalette(),
            ),
            const DocSection(
              title: 'Semantic aliases',
              description:
                  'Use these when intent matters more than the specific hue. '
                  'Each alias is just a `static const` pointer.',
              child: _SemanticAliases(),
            ),
            const DocSection(
              title: 'Neutrals',
              description:
                  'Scaffold background, card surface, text + on-color, and '
                  'disabled gray.',
              child: _Neutrals(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'Container(color: GameColors.primary)\n'
              'Text("Hi", style: TextStyle(color: GameColors.textPrimary))',
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandPalette extends StatelessWidget {
  const _BrandPalette();

  @override
  Widget build(BuildContext context) {
    const swatches = [
      _Swatch('Vibrant Blue', '#4A90E2', GameColors.vibrantBlue),
      _Swatch('Sunny Yellow', '#FFD700', GameColors.sunnyYellow),
      _Swatch('Grass Green', '#50C878', GameColors.grassGreen),
      _Swatch('Friendly Orange', '#FF6B6B', GameColors.friendlyOrange),
      _Swatch('Purple', '#9B59B6', GameColors.purple),
    ];
    return const Wrap(spacing: 16, runSpacing: 16, children: swatches);
  }
}

class _SemanticAliases extends StatelessWidget {
  const _SemanticAliases();

  @override
  Widget build(BuildContext context) {
    const aliases = [
      _AliasRow('primary', 'vibrantBlue', GameColors.primary),
      _AliasRow('warning', 'sunnyYellow', GameColors.warning),
      _AliasRow('success', 'grassGreen', GameColors.success),
      _AliasRow('danger', 'friendlyOrange', GameColors.danger),
      _AliasRow('accent', 'purple', GameColors.accent),
    ];
    return const Column(children: aliases);
  }
}

class _Neutrals extends StatelessWidget {
  const _Neutrals();

  @override
  Widget build(BuildContext context) {
    const neutrals = [
      _NeutralRow('background', GameColors.background),
      _NeutralRow('surface', GameColors.surface),
      _NeutralRow('textPrimary', GameColors.textPrimary),
      _NeutralRow('textOnPrimary', GameColors.textOnPrimary),
      _NeutralRow('disabled', GameColors.disabled),
    ];
    return const Column(children: neutrals);
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch(this.label, this.hex, this.color);

  final String label;
  final String hex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(height: 8),
          Text(label, style: DocTheme.body, textAlign: TextAlign.center),
          Text(hex, style: DocTheme.caption),
        ],
      ),
    );
  }
}

class _AliasRow extends StatelessWidget {
  const _AliasRow(this.alias, this.mapsTo, this.color);

  final String alias;
  final String mapsTo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DocTheme.body,
                children: [
                  TextSpan(
                    text: alias,
                    style: DocTheme.body.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const TextSpan(text: '  →  '),
                  TextSpan(text: mapsTo, style: DocTheme.caption),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NeutralRow extends StatelessWidget {
  const _NeutralRow(this.name, this.color);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final hex =
        '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: DocTheme.border),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: DocTheme.body)),
          Text(hex, style: DocTheme.caption),
        ],
      ),
    );
  }
}
