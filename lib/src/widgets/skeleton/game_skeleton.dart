import 'package:flutter/widgets.dart';

/// Named default height for [GameSkeleton] (logical pixels). [height] also
/// accepts any raw number; this is the recommended default.
abstract final class GameSkeletonSize {
  GameSkeletonSize._();

  static const double height = 16;
}

/// Animated shimmer placeholder used while content is loading.
///
/// Renders a rounded rectangle of ([width], [height]) with a linear gradient
/// whose highlight stop sweeps from left to right. Drop into card / list
/// scaffolds to indicate pending data.
class GameSkeleton extends StatefulWidget {
  const GameSkeleton({
    this.width,
    this.height = GameSkeletonSize.height,
    this.borderRadius = 8.0,
    this.baseColor = const Color(0xFFE5E9F0),
    this.highlightColor = const Color(0xFFF5F7FA),
    this.duration = const Duration(milliseconds: 1100),
    super.key,
  });

  final double? width;
  final double height;
  final double borderRadius;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  @override
  State<GameSkeleton> createState() => _GameSkeletonState();
}

class _GameSkeletonState extends State<GameSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat();

  @override
  void didUpdateWidget(covariant GameSkeleton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller
        ..reset()
        ..repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        // Sweep highlight from left edge (-1) to right edge (2) so it fully
        // exits the box before looping.
        final value = _controller.value;
        final center = -1.0 + value * 3.0;
        final start = (center - 0.3).clamp(-1.0, 2.0);
        final end = (center + 0.3).clamp(-1.0, 2.0);
        final stops = [
          ((start + 1.0) / 3.0).clamp(0.0, 1.0),
          ((center + 1.0) / 3.0).clamp(0.0, 1.0),
          ((end + 1.0) / 3.0).clamp(0.0, 1.0),
        ];
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: stops,
            ),
          ),
        );
      },
    );
  }
}
