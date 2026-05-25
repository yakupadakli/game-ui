import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameButton] examples.
class GameButtonPage extends StatefulWidget {
  const GameButtonPage({super.key});

  @override
  State<GameButtonPage> createState() => _GameButtonPageState();
}

class _GameButtonPageState extends State<GameButtonPage> {
  int _taps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameButton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameButton',
              subtitle: 'PNG-asset · variant-based · pixel-perfect',
              body:
                  'Single button widget driven by a [GameButtonVariant]. The '
                  'variant chooses which bundled PNG renders behind the '
                  'optional child. Currently only `circle` ships; future '
                  'variants (primary, secondary, warning…) will land as the '
                  'asset library grows.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Default — tap to count',
              description:
                  'Taps so far: $_taps. Default variant is circle, size 96.',
              child: Center(
                child: GameButton(
                  onTap: () => setState(() => _taps++),
                  child: const _Number('1'),
                ),
              ),
            ),
            const DocSection(
              title: 'Square variant (code-rendered)',
              description:
                  'GameButtonVariant.square draws a glossy squircle entirely '
                  'in code — no PNG asset. Layered depth rim, radial-gradient '
                  'face, specular blob, and outer purple-blue glow.',
              child: _SquareRow(),
            ),
            const DocSection(
              title: 'Sizes',
              description:
                  '48 · 64 · 96 · 128. The PNG scales via fit.contain and '
                  'the child font scales proportionally.',
              child: _SizeRow(),
            ),
            const DocSection(
              title: 'Custom child',
              description:
                  'Pass any widget as child — number, icon, or composed '
                  'content. Note: if the bundled PNG has a label baked in, '
                  'the child renders ON TOP of it; swap to a blank template '
                  'for fully custom content.',
              child: _ChildRow(),
            ),
            const DocSection(
              title: 'Tint',
              description:
                  'Optional [tint] applies BlendMode.modulate to the bundled '
                  'PNG. Works best with grayscale / white-base assets; '
                  'preserves highlights and shadows.',
              child: _TintRow(),
            ),
            const DocSection(
              title: 'Disabled',
              description:
                  'GameDisabledOverlay applies Opacity(0.38) to the whole '
                  'image; GameTapScale is also disabled so no animation fires.',
              child: _DisabledRow(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameButton(\n'
              '  variant: GameButtonVariant.circle,\n'
              '  size: 96,\n'
              '  onTap: handlePress,\n'
              "  child: Text('1'),\n"
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _SquareRow extends StatelessWidget {
  const _SquareRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        GameButton(
          variant: GameButtonVariant.square,
          size: 96,
          onTap: () {},
          child: const _Number('1'),
        ),
        GameButton(
          variant: GameButtonVariant.square,
          size: 96,
          onTap: () {},
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.white,
            size: 44,
          ),
        ),
        GameButton(
          variant: GameButtonVariant.square,
          size: 64,
          onTap: () {},
          child: const _Number('2', buttonSize: 64),
        ),
        const GameButton(variant: GameButtonVariant.square, enabled: false),
      ],
    );
  }
}

class _SizeRow extends StatelessWidget {
  const _SizeRow();

  @override
  Widget build(BuildContext context) {
    const sizes = [48.0, 64.0, 96.0, 128.0];
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: sizes
          .map(
            (s) => GameButton(
              size: s,
              onTap: () {},
              child: _Number('1', buttonSize: s),
            ),
          )
          .toList(),
    );
  }
}

class _ChildRow extends StatelessWidget {
  const _ChildRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        GameButton(onTap: () {}, child: const _Number('5')),
        GameButton(
          onTap: () {},
          child: const Icon(
            Icons.play_arrow_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
        GameButton(
          onTap: () {},
          child: const Icon(
            Icons.favorite_rounded,
            color: Colors.white,
            size: 36,
          ),
        ),
      ],
    );
  }
}

class _TintRow extends StatelessWidget {
  const _TintRow();

  @override
  Widget build(BuildContext context) {
    const tints = <Color?>[
      null,
      Color(0xFFE53935), // red
      Color(0xFF43A047), // green
      Color(0xFFFFB300), // amber
      Color(0xFF8E24AA), // purple
      Colors.red,
      GameColors.primary,
      GameColors.warning,
      GameColors.success,
      GameColors.danger,
      GameColors.accent,
    ];
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: tints
          .map(
            (t) => GameButton(tint: t, onTap: () {}, child: const _Number('1')),
          )
          .toList(),
    );
  }
}

class _DisabledRow extends StatelessWidget {
  const _DisabledRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GameButton(onTap: () {}, child: const _Number('1')),
        const GameButton(enabled: false, child: _Number('2')),
      ],
    );
  }
}

class _Number extends StatelessWidget {
  const _Number(this.value, {this.buttonSize = 96});

  final String value;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    final fontSize = buttonSize * 0.55;
    final base = TextStyle(
      fontFamily: 'BalooChettan2',
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      height: 1.0,
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          value,
          style: base.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = fontSize * 0.10
              ..strokeJoin = StrokeJoin.round
              ..color = Colors.black.withValues(alpha: 0.45),
          ),
        ),
        Text(value, style: base.copyWith(color: Colors.white)),
      ],
    );
  }
}
