import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_disabled_overlay.dart';
import '../text/game_stroked_text.dart';
import 'game_button_palette.dart';
import 'game_button_surface.dart';

/// Named default size for [GameTrueFalseButton] (logical pixels). [width] /
/// [height] also accept any raw number; these are the recommended defaults.
abstract final class GameTrueFalseButtonSize {
  GameTrueFalseButtonSize._();

  static const double width = 160;
  static const double height = 72;
}

/// Paired true/false answer button — green when [isTrue], red otherwise.
///
/// Used in two-up rows for boolean answer questions. Pass [isSelected] to
/// indicate the player's current pick (renders a thicker outer ring).
class GameTrueFalseButton extends StatelessWidget {
  const GameTrueFalseButton({
    required this.text,
    required this.isTrue,
    required this.onTap,
    this.isSelected = false,
    this.width = GameTrueFalseButtonSize.width,
    this.height = GameTrueFalseButtonSize.height,
    this.enabled = true,
    super.key,
  });

  final String text;
  final bool isTrue;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;
  final double height;
  final bool enabled;

  static const GameButtonPalette _truePalette = GameButtonPalette(
    face: Color(0xFF8BC53D),
    depth: Color(0xFF2C4F2E),
    innerRing: Color(0xFF335815),
    highlight: Color(0xFFB3D779),
    shadow: Color(0xFF5C9628),
    stroke: Color(0xFF335815),
  );

  static const GameButtonPalette _falsePalette = GameButtonPalette(
    face: Color(0xFFF14D4C),
    depth: Color(0xFF8A1414),
    innerRing: Color(0xFF691F1B),
    highlight: Color(0xFFF87E73),
    shadow: Color(0xFFAF2B2B),
    stroke: Color(0xFF691F1B),
  );

  @override
  Widget build(BuildContext context) {
    final palette = isTrue ? _truePalette : _falsePalette;
    final radius = height * 0.30;
    final depthInset = height * 0.07;
    final fontSize = height * 0.42;

    final button = GameButtonSurface(
      palette: palette,
      width: width,
      height: height,
      borderRadius: radius,
      depthInset: depthInset,
      // Unselected buttons sit on a white plate with the depth tone as the
      // ring; selecting swaps the plate to the depth tone for a thick border.
      baseColor: isSelected ? palette.depth : Colors.white,
      ringColor: palette.depth,
      faceInsets: EdgeInsets.only(
        top: depthInset,
        left: depthInset * 1.4,
        right: depthInset * 1.4,
        bottom: depthInset * 2,
      ),
      gradientRadius: 1.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isTrue ? Icons.check_circle : Icons.cancel,
            color: Colors.white,
            size: fontSize,
          ),
          SizedBox(width: fontSize * 0.25),
          GameStrokedText(
            text,
            color: Colors.white,
            strokeColor: palette.stroke,
            fontSize: fontSize,
            strokeWidth: fontSize * 0.10,
            fontFamily: GameDesignTokens.fontFamilyDisplay,
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    );

    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(enabled: enabled, onTap: onTap, child: button),
    );
  }
}
