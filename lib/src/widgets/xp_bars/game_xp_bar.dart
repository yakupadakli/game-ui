import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';

part 'game_xp_bar_painters.dart';

/// Visual styles for [GameXpBar] — all rendered entirely in code.
enum GameXpBarStyle {
  /// Blue tube frame with a glossy blue pill fill.
  blue,

  /// Purple tube frame with a glossy purple pill fill.
  purple,

  /// Orange banner with a pennant tail, flame badge, and gold segment fill.
  fire,

  /// Silver recessed track with a glossy rainbow-gradient fill.
  rainbow,

  /// Silver recessed track with a gold-rimmed segmented orange fill.
  orange,
}

/// XP / progress bar drawn entirely in code: an empty track plus a fill
/// revealed left-to-right by [progress] (0..1). The fill is reveal-clipped
/// (not stretched), so its shading keeps its proportions.
class GameXpBar extends StatelessWidget {
  const GameXpBar({
    required this.progress,
    this.style = GameXpBarStyle.fire,
    this.width = 240,
    this.height = 32,
    this.child,
    super.key,
  });

  /// Fill fraction, clamped to 0..1.
  final double progress;
  final GameXpBarStyle style;

  final double width;
  final double height;

  /// Optional centered overlay (e.g. a "120 / 200 XP" label).
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final p = progress.clamp(0.0, 1.0);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        // Left-align so the fill reveal grows from the left edge. Children get
        // loose constraints here (not tight), so Align's widthFactor actually
        // shrink-wraps and ClipRect reveals only the left `p` fraction.
        alignment: Alignment.centerLeft,
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: _XpBarPainter(style: style, fill: false),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: p,
              child: CustomPaint(
                size: Size(width, height),
                painter: _XpBarPainter(style: style, fill: true),
              ),
            ),
          ),
          if (child != null) Positioned.fill(child: Center(child: child!)),
        ],
      ),
    );
  }
}
