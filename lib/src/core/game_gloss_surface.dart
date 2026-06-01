import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'game_colors.dart';

/// A glossy rounded surface drawn from a single [color]: a flat body that rolls
/// into a deep saturated bottom lip, a bright tight top rim, a crisp dark inset
/// edge, and a small rotated blurred top-left corner highlight. [child] is
/// layered on top of the gloss (position it yourself, e.g. with a [Center]).
///
/// The rim, lip and edge are all derived from [color] (via [GameColors]), so
/// any color reads as glossy plastic. Pass a pill [borderRadius] for a knob, or
/// a rounded-square one for a tile. [referenceSize] is the length the inset
/// edge and highlight scale against — use the shorter side.
///
/// Shared chrome behind [GameTileButton] and the [GameToggle] knob.
class GameGlossSurface extends StatelessWidget {
  const GameGlossSurface({
    required this.color,
    required this.borderRadius,
    required this.referenceSize,
    this.highlightScale = 1.0,
    this.highlightOffset = const Offset(0.0776, 0.0647),
    this.edgeWidthScale = 1.0,
    this.child,
    super.key,
  });

  /// Body/base color; the rim, lip and edge derive from it.
  final Color color;

  /// Shape of the surface (rounded-square for a tile, pill for a knob).
  final BorderRadius borderRadius;

  /// Reference length the inset edge and corner highlight scale against
  /// (typically the shorter side of the surface).
  final double referenceSize;

  /// Multiplier on the top-left corner highlight size. Wide-but-short surfaces
  /// (e.g. a pill knob) want a larger value so the glint stays visible; the
  /// default 1.0 suits square tiles.
  final double highlightScale;

  /// Top-left position of the corner highlight, in fractions of
  /// [referenceSize] (x from the left edge, y from the top). Tune it so the
  /// glint sits on the rounded shoulder; the default suits square tiles.
  final Offset highlightOffset;

  /// Multiplier on the dark inset edge thickness. The default 1.0 is a thin
  /// hairline; raise it for a more prominent inner border.
  final double edgeWidthScale;

  /// Content layered on the gloss; not positioned by this widget.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // Bright tight top rim near the top edge.
    final rim = GameColors.lighten(color, 0.16);
    // Deep, saturated bottom lip and inset edge — a glossy surface darkens
    // *and* enriches toward the bottom, which a plain lightness drop can't.
    final lip = GameColors.deepen(color, 0.24, 0.10);
    final borderColor = GameColors.deepen(color, 0.30, 0.20);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Flat body that rolls into a deep dark lip at the very bottom.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color, color, GameColors.darken(color, 0.10), lip],
                stops: const [0.0, 0.85, 0.93, 1.0],
              ),
            ),
          ),
          // Bright, tight glossy top rim.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [rim, rim.withValues(alpha: 0)],
                stops: const [0.0, 0.08],
              ),
            ),
          ),
          // Crisp dark inset edge.
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: Border.all(
                color: borderColor,
                width: referenceSize * 0.016 * edgeWidthScale,
              ),
            ),
          ),
          ?child,
          // Rotated, blurred specular highlight (top-left) — bright white so it
          // reads as a glint rather than a tinted smudge.
          Positioned(
            left: referenceSize * highlightOffset.dx,
            top: referenceSize * highlightOffset.dy,
            child: Transform.rotate(
              angle: -22 * math.pi / 180,
              child: ImageFiltered(
                imageFilter: ui.ImageFilter.blur(
                  sigmaX: referenceSize * 0.010,
                  sigmaY: referenceSize * 0.010,
                ),
                child: Container(
                  width: referenceSize * 0.10 * highlightScale,
                  height: referenceSize * 0.056 * highlightScale,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(referenceSize),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
