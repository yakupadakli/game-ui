import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// Reproduces the "Matematik Dünyası" design-system reference screen, composed
/// entirely from `game_ui` foundations plus the new [GameOperationCard].
class GameDesignSystemPage extends StatelessWidget {
  const GameDesignSystemPage({super.key});

  static const _sectionTitle = TextStyle(
    fontFamily: 'BalooChettan2',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: GameColors.textNavy,
    height: 1.2,
  );

  static const _caption = TextStyle(
    fontFamily: 'Fredoka',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color(0xFF5A6E8C),
    height: 1.3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.background,
      appBar: AppBar(
        title: const Text('Design System'),
        backgroundColor: GameColors.background,
        foregroundColor: GameColors.textNavy,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _Section(title: 'Typography', child: _TypographyBlock()),
            _Section(title: 'Color Palette', child: _ColorPaletteBlock()),
            _Section(title: 'Buttons & Cards', child: _ButtonsAndCardsBlock()),
            _Section(title: 'Mascots', child: _MascotsBlock()),
            _Section(title: 'Icons', child: _IconsBlock()),
            _Section(
              title: 'Textures & Backgrounds',
              child: _BackgroundsBlock(),
            ),
          ],
        ),
      ),
    );
  }
}

/// A navy section heading above its [child] content.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GameDesignSystemPage._sectionTitle),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

/// Centered caption beneath a sample group.
class _SampleCaption extends StatelessWidget {
  const _SampleCaption(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(child: Text(text, style: GameDesignSystemPage._caption)),
    );
  }
}

// ---------------------------------------------------------------------------
// Typography
// ---------------------------------------------------------------------------

class _TypographyBlock extends StatelessWidget {
  const _TypographyBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        GameStrokedTitle(
          'Matematik Dünyası',
          fontSize: 40,
          strokeColor: GameColors.vibrantBlue,
          strokeWidth: 6,
        ),
        SizedBox(height: 4),
        _SampleCaption('Heading Font'),
        SizedBox(height: 18),
        Text(
          'Seviye 8',
          style: TextStyle(
            fontFamily: 'Fredoka',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: GameColors.textNavy,
          ),
        ),
        SizedBox(height: 2),
        _SampleCaption('Body Text'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Color palette
// ---------------------------------------------------------------------------

class _ColorPaletteBlock extends StatelessWidget {
  const _ColorPaletteBlock();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 12,
      runSpacing: 16,
      alignment: WrapAlignment.spaceBetween,
      children: [
        _Swatch('Sky Blue', '#007AFF', GameColors.bearBlue),
        _Swatch('Addition Green', '#50C878', GameColors.grassGreen),
        _Swatch('Subtraction Red', '#FF6B6B', GameColors.friendlyCoral),
        _Swatch('Multiplication Yellow', '#FFD700', GameColors.sunnyYellow),
        _Swatch('Division Blue', '#4A90E2', GameColors.vibrantBlue),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  const _Swatch(this.name, this.hex, this.color);

  final String name;
  final String hex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFFFFFFF), width: 3),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Fredoka',
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: GameColors.textNavy,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            hex,
            style: const TextStyle(
              fontFamily: 'Fredoka',
              fontSize: 11,
              color: Color(0xFF8195AE),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Buttons & cards
// ---------------------------------------------------------------------------

class _ButtonsAndCardsBlock extends StatelessWidget {
  const _ButtonsAndCardsBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: _PrimaryButton(label: 'Oyna', onTap: () {}),
        ),
        const _SampleCaption('Primary Button'),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: GameOperationCard(
                operation: GameOperation.addition,
                title: 'Toplama Adası',
                subtitle: 'Seviye 8',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GameOperationCard(
                operation: GameOperation.subtraction,
                title: 'Çıkarma Adası',
                subtitle: 'Seviye 4',
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: GameOperationCard(
                operation: GameOperation.multiplication,
                title: 'Çarpma Adası',
                subtitle: 'Seviye 2',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GameOperationCard(
                operation: GameOperation.division,
                title: 'Bölme Adası',
                subtitle: 'Seviye 1',
                onTap: () {},
              ),
            ),
          ],
        ),
        const _SampleCaption('Operation Cards'),
      ],
    );
  }
}

/// Green glossy "Oyna ▶" pill, composed from [GameGlossSurface].
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const face = GameColors.grassGreen;

    return GameTapScale(
      onTap: onTap,
      child: SizedBox(
        height: 58,
        width: 190,
        child: GameGlossSurface(
          color: face,
          borderRadius: BorderRadius.circular(29),
          referenceSize: 58,
          highlightScale: 2.6,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GameStrokedText(
                  label,
                  color: const Color(0xFFFFFFFF),
                  strokeColor: GameColors.deepen(face, 0.30, 0.18),
                  fontSize: 26,
                  strokeWidth: 3,
                  fontFamily: 'BalooChettan2',
                  fontWeight: FontWeight.w800,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.play_arrow_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Mascots
// ---------------------------------------------------------------------------

class _MascotsBlock extends StatelessWidget {
  const _MascotsBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Wrap(
          spacing: 18,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            _CircleMascot(GameMascot.bear, GameColors.grassGreen),
            _CircleMascot(GameMascot.penguin, GameColors.friendlyCoral),
            _CircleMascot(GameMascot.fox, GameColors.sunnyYellow),
            _CircleMascot(GameMascot.elephant, GameColors.vibrantBlue),
          ],
        ),
        _SampleCaption('Mascot Icons'),
      ],
    );
  }
}

/// A mascot head on a colored disc with a white ring.
class _CircleMascot extends StatelessWidget {
  const _CircleMascot(this.mascot, this.background);

  final GameMascot mascot;
  final Color background;

  @override
  Widget build(BuildContext context) {
    const diameter = 72.0;
    return Container(
      width: diameter,
      height: diameter,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: background,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFFFFFF), width: 3),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipOval(
        child: GameMascotImage(
          mascot: mascot,
          pose: GameMascotPose.head,
          size: diameter,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Icons
// ---------------------------------------------------------------------------

class _IconsBlock extends StatelessWidget {
  const _IconsBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Wrap(
          spacing: 28,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            GameStarRating(starCount: 2, maxStars: 3, size: 36),
            Icon(
              Icons.play_arrow_rounded,
              color: GameColors.grassGreen,
              size: 40,
            ),
            GamePageIndicator(
              count: 3,
              currentIndex: 0,
              activeColor: GameColors.grassGreen,
              dotSize: 14,
            ),
          ],
        ),
        _SampleCaption('UI Icons'),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Textures & backgrounds
// ---------------------------------------------------------------------------

class _BackgroundsBlock extends StatelessWidget {
  const _BackgroundsBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFFFFFFF), width: 4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: const SizedBox(
                height: 96,
                width: double.infinity,
                child: GameBackground(child: SizedBox.shrink()),
              ),
            ),
          ),
        ),
        const _SampleCaption('Textures & Backgrounds'),
      ],
    );
  }
}
