import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_disabled_overlay.dart';
import '../text/game_stroked_text.dart';
import 'game_button_palette.dart';
import 'game_button_surface.dart';

/// Visual variants of [GameNumpadButton]. The variant decides which palette
/// the button uses (digits get the calm blue palette, special keys get
/// red/orange to stand out).
enum GameNumpadButtonType { number, delete, clear }

/// Named default size for [GameNumpadButton] (logical pixels). [width] /
/// [height] also accept any raw number; these are the recommended defaults.
abstract final class GameNumpadButtonSize {
  GameNumpadButtonSize._();

  static const double width = 80;
  static const double height = 64;
}

/// A single key in a numeric pad — layered "rect button" look (depth rim +
/// gradient face + dark border + curved gloss).
///
/// Typically composed by [GameNumpad]; can be used standalone for
/// custom-shaped numpads.
class GameNumpadButton extends StatelessWidget {
  const GameNumpadButton({
    required this.value,
    required this.onTap,
    this.type = GameNumpadButtonType.number,
    this.width = GameNumpadButtonSize.width,
    this.height = GameNumpadButtonSize.height,
    this.enabled = true,
    super.key,
  });

  final String value;
  final VoidCallback onTap;
  final GameNumpadButtonType type;
  final double width;
  final double height;
  final bool enabled;

  // Palettes — face, depth, innerRing, highlight, shadow, stroke.
  static const GameButtonPalette _red = GameButtonPalette(
    face: Color(0xFFE45A5A),
    depth: Color(0xFFAF2B2B),
    innerRing: Color(0xFF6B1414),
    highlight: Color(0xFFEF8A8A),
    shadow: Color(0xFFB23C3C),
    stroke: Color(0xFF691F1B),
  );
  static const GameButtonPalette _orange = GameButtonPalette(
    face: Color(0xFFFF9F43),
    depth: Color(0xFFCC7A2E),
    innerRing: Color(0xFF8A4B14),
    highlight: Color(0xFFFFBE76),
    shadow: Color(0xFFCC7A2E),
    stroke: Color(0xFF7A4A11),
  );

  GameButtonPalette get _palette => switch (type) {
    GameNumpadButtonType.number => GameButtonPalette.blue,
    GameNumpadButtonType.delete => _red,
    GameNumpadButtonType.clear => _orange,
  };

  @override
  Widget build(BuildContext context) {
    final palette = _palette;
    final radius = height * 0.22;
    final depthInset = height * 0.06;
    final fontSize = height * 0.45;

    final button = GameButtonSurface(
      palette: palette,
      width: width,
      height: height,
      borderRadius: radius,
      depthInset: depthInset,
      faceInsets: EdgeInsets.only(
        top: depthInset * 0.5,
        left: depthInset,
        right: depthInset,
        bottom: depthInset * 1.5,
      ),
      child: GameStrokedText(
        value,
        color: Colors.white,
        strokeColor: palette.stroke,
        fontSize: fontSize,
        strokeWidth: fontSize * 0.10,
        fontFamily: GameDesignTokens.fontFamilyDisplay,
        fontWeight: FontWeight.w800,
      ),
    );

    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(enabled: enabled, onTap: onTap, child: button),
    );
  }
}
