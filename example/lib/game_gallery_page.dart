import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// Compact preview of every foundation piece on one scrollable screen.
class GameGalleryPage extends StatelessWidget {
  const GameGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Gallery'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'Overview',
              subtitle: 'game_ui foundation',
              body:
                  'Live mini samples of every foundation piece. For isolated '
                  'scenarios and the full API, open the dedicated doc pages '
                  'from the index screen.',
            ),
            SizedBox(height: 24),
            _GallerySection(title: 'Color palette', child: _ColorPalette()),
            _GallerySection(title: 'Typography', child: _Typography()),
            _GallerySection(title: 'Radius', child: _RadiusScale()),
            _GallerySection(title: 'Shadows', child: _ShadowScale()),
            _GallerySection(title: 'Disabled overlay', child: _DisabledDemo()),
            _GallerySection(title: 'Tap scale', child: _TapScaleDemo()),
            _GallerySection(title: 'Strings (i18n)', child: _StringsDemo()),
          ],
        ),
      ),
    );
  }
}

class _GallerySection extends StatelessWidget {
  const _GallerySection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: DocTheme.sectionTitle),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _ColorPalette extends StatelessWidget {
  const _ColorPalette();

  @override
  Widget build(BuildContext context) {
    const swatches = [
      _Swatch('Vibrant Blue', GameColors.vibrantBlue),
      _Swatch('Sunny Yellow', GameColors.sunnyYellow),
      _Swatch('Grass Green', GameColors.grassGreen),
      _Swatch('Friendly Orange', GameColors.friendlyOrange),
      _Swatch('Purple', GameColors.purple),
    ];
    return const Wrap(spacing: 16, runSpacing: 16, children: swatches);
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(height: 6),
          Text(label, style: DocTheme.caption, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _Typography extends StatelessWidget {
  const _Typography();

  @override
  Widget build(BuildContext context) {
    const sample = 'The quick brown fox';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sample, style: GameTextStyles.heading2),
        Text(sample, style: GameTextStyles.body),
        const SizedBox(height: 8),
        Text(
          sample,
          style: GameTextStyles.heading2.copyWith(fontFamily: 'BalooChettan2'),
        ),
        Text(
          sample,
          style: GameTextStyles.body.copyWith(fontFamily: 'BalooChettan2'),
        ),
      ],
    );
  }
}

class _RadiusScale extends StatelessWidget {
  const _RadiusScale();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: const [
        _RadiusTile('sm', GameDesignTokens.radiusSM),
        _RadiusTile('md', GameDesignTokens.radiusMD),
        _RadiusTile('lg', GameDesignTokens.radiusLG),
        _RadiusTile('pill', GameDesignTokens.radiusPill),
      ],
    );
  }
}

class _RadiusTile extends StatelessWidget {
  const _RadiusTile(this.label, this.radius);

  final String label;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 44,
          decoration: BoxDecoration(
            color: GameColors.primary,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: DocTheme.caption),
      ],
    );
  }
}

class _ShadowScale extends StatelessWidget {
  const _ShadowScale();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children: const [
        _ShadowTile('card', GameShadows.card),
        _ShadowTile('button', GameShadows.button),
      ],
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
          width: 112,
          height: 52,
          decoration: BoxDecoration(
            color: GameColors.surface,
            borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
            boxShadow: shadow,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: DocTheme.caption),
      ],
    );
  }
}

class _DisabledDemo extends StatelessWidget {
  const _DisabledDemo();

  @override
  Widget build(BuildContext context) {
    Widget tile() => Container(
      width: 72,
      height: 48,
      decoration: BoxDecoration(
        color: GameColors.primary,
        borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
      ),
    );
    return Row(
      children: [
        Column(
          children: [
            GameDisabledOverlay(disabled: false, child: tile()),
            const SizedBox(height: 4),
            Text('enabled', style: DocTheme.caption),
          ],
        ),
        const SizedBox(width: 24),
        Column(
          children: [
            GameDisabledOverlay(disabled: true, child: tile()),
            const SizedBox(height: 4),
            Text('disabled', style: DocTheme.caption),
          ],
        ),
      ],
    );
  }
}

class _TapScaleDemo extends StatelessWidget {
  const _TapScaleDemo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GameTapScale(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: GameDesignTokens.spacingXL,
              vertical: GameDesignTokens.spacingMD,
            ),
            decoration: BoxDecoration(
              color: GameColors.primary,
              borderRadius: BorderRadius.circular(GameDesignTokens.radiusPill),
              boxShadow: GameShadows.button,
            ),
            child: Text('Tap me', style: GameTextStyles.buttonLabel),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'Press to see the scale animation.',
            style: DocTheme.caption,
          ),
        ),
      ],
    );
  }
}

class _StringsDemo extends StatelessWidget {
  const _StringsDemo();

  @override
  Widget build(BuildContext context) {
    final s = context.gameUiStrings;
    final rows = <(String, String)>[
      ('dialogOk', s.dialogOk),
      ('dialogCancel', s.dialogCancel),
      ('searchDefaultHint', s.searchDefaultHint),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: RichText(
                text: TextSpan(
                  style: DocTheme.body,
                  children: [
                    TextSpan(text: '${e.$1}: ', style: DocTheme.caption),
                    TextSpan(
                      text: e.$2,
                      style: DocTheme.body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
