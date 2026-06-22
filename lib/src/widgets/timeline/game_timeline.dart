import 'package:flutter/material.dart';

import '../../core/game_colors.dart';

/// A single entry inside [GameTimeline] — its dot color, optional icon, and
/// completion state alongside the row [child].
class GameTimelineEntry {
  const GameTimelineEntry({
    required this.child,
    this.color = GameColors.primary,
    this.icon,
    this.completed = false,
  });

  final Widget child;
  final Color color;
  final IconData? icon;
  final bool completed;
}

/// Vertical timeline of [GameTimelineEntry]s — colored dots connected by a
/// thin rail, with arbitrary widgets to the right of each dot.
///
/// Useful for quest progress, level milestones, changelogs. The last entry
/// has no trailing rail. Each row stretches to fit its [GameTimelineEntry.child]
/// using [IntrinsicHeight] so the connecting line always reaches the next dot.
class GameTimeline extends StatelessWidget {
  const GameTimeline({
    required this.entries,
    this.dotSize = 24.0,
    this.lineWidth = 2.0,
    this.lineColor = const Color(0xFFCFD8E3),
    this.spacing = 16.0,
    super.key,
  });

  final List<GameTimelineEntry> entries;
  final double dotSize;
  final double lineWidth;
  final Color lineColor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entries.length, (index) {
        final entry = entries[index];
        final isLast = index == entries.length - 1;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: dotSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Dot(
                      size: dotSize,
                      color: entry.color,
                      icon: entry.completed ? Icons.check : entry.icon,
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(width: lineWidth, color: lineColor),
                      ),
                  ],
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : spacing),
                  child: entry.child,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.size, required this.color, this.icon});

  final double size;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: icon == null
          ? null
          : Icon(icon, size: size * 0.6, color: Colors.white),
    );
  }
}
