import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_button_size.dart';
import '../../core/game_disabled_overlay.dart';
import 'game_button_palette.dart';
import 'game_button_variant.dart';
import 'game_glossy_button_surface.dart';

/// A game-style button. The [variant] decides which glossy background renders
/// behind the [child]. Both variants are drawn entirely in code (no PNG
/// assets). [GameTapScale] + [GameDisabledOverlay] handle the press animation
/// and disabled state.
///
/// [child] overlays the background, slightly shifted up to compensate for
/// the per-variant depth rim.
class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    this.variant = GameButtonVariant.circle,
    this.size = GameButtonSize.medium,
    this.child = const SizedBox.shrink(),
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.tint,
  });

  final GameButtonVariant variant;
  final double size;
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  /// Optional color that recolors the glossy face. When set, a full depth
  /// palette is derived from it via [GameButtonPalette.fromSeed]; otherwise the
  /// variant's default blue palette is used.
  final Color? tint;

  // Default blue palettes with a deep navy depth rim, matching the original
  // glossy button art.
  // Tones sampled from the original circle button art: a nearly flat vivid
  // blue face inside a bright inner ring and a deep navy edge.
  static const GameButtonPalette _circlePalette = GameButtonPalette(
    face: Color(0xFF3A91FF),
    depth: Color(0xFF02108E),
    innerRing: Color(0xFF2470F0),
    highlight: Color(0xFF4B9EFF),
    shadow: Color(0xFF4093F8),
    stroke: Color(0xFF06215E),
  );
  static const GameButtonPalette _squarePalette = GameButtonPalette(
    face: Color(0xFF4A90FF),
    depth: Color(0xFF1E5BCC),
    innerRing: Color(0xFF0030A0),
    highlight: Color(0xFF80C8FF),
    shadow: Color(0xFF3070D0),
    stroke: Color(0xFF003E91),
  );

  @override
  Widget build(BuildContext context) {
    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(
        enabled: enabled && (onTap != null || onLongPress != null),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _background(),
            Padding(
              padding: EdgeInsets.only(bottom: size * variant.faceLiftRatio),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _background() {
    final base = variant == GameButtonVariant.circle
        ? _circlePalette
        : _squarePalette;
    final palette = tint == null ? base : GameButtonPalette.fromSeed(tint!);
    return GameGlossyButtonSurface(
      width: size,
      height: size,
      palette: palette,
      shape: variant == GameButtonVariant.circle
          ? GameGlossyButtonShape.circle
          : GameGlossyButtonShape.squircle,
      glow: variant == GameButtonVariant.square
          ? const Color(0xFF6B6BFF)
          : null,
    );
  }
}
