import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_button_size.dart';
import '../../core/game_colors.dart';
import '../../core/game_disabled_overlay.dart';

part 'game_tile_button_gloss_face.dart';

/// Glossy rounded-square tile button, drawn entirely in code from a single
/// [color]: a white outer frame with a soft drop shadow, a rounded inner face
/// built from a multi-stop vertical gradient (bright top rim → flat body →
/// deep saturated bottom lip), a crisp dark inset edge, and a blurred corner
/// highlight. [child] is centered on the face, inset clear of the frame and
/// the bottom lip.
///
/// This is the base chrome shared by the difficulty buttons; use it directly
/// to build any glossy plastic tile. [GameTapScale] + [GameDisabledOverlay]
/// handle the press animation and disabled state.
class GameTileButton extends StatelessWidget {
  const GameTileButton({
    required this.color,
    this.frameColor = Colors.white,
    this.size = GameButtonSize.large,
    this.child = const SizedBox.shrink(),
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    super.key,
  });

  /// Face/body base color. The top rim, bottom lip and inset edge are derived
  /// from it.
  final Color color;

  /// Outer frame color behind the face (defaults to white).
  final Color frameColor;

  /// Visual edge length of the square tile.
  final double size;

  /// Content centered on the face (inset clear of the frame and bottom lip).
  final Widget child;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    // Frame thickness matches the reference tile (~4.6%); radii are nudged
    // rounder to read like a soft plastic pebble.
    final frameThickness = size * 0.0469;
    final outerRadius = size * 0.18;
    final innerRadius = size * 0.14;
    final innerSize = size - frameThickness * 2;

    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(
        enabled: enabled && (onTap != null || onLongPress != null),
        onTap: onTap,
        onLongPress: onLongPress,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: frameColor,
            borderRadius: BorderRadius.circular(outerRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: size * 0.0547,
                offset: Offset(0, size * 0.0195),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(frameThickness),
            child: SizedBox.square(
              dimension: innerSize,
              child: _GlossFace(
                face: color,
                radius: innerRadius,
                innerSize: innerSize,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(innerSize * 0.15),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
