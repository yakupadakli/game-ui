import 'package:flutter/widgets.dart';

import '../core/game_colors.dart';

/// A blinking text cursor — fades in and out on a fixed interval.
///
/// Use next to an input value to suggest the active editing position
/// (typical in game numpads, name entry screens).
class GameBlinkingCursor extends StatefulWidget {
  const GameBlinkingCursor({
    this.color = GameColors.textPrimary,
    this.width = 3.0,
    this.height = 28.0,
    this.duration = const Duration(milliseconds: 500),
    super.key,
  });

  final Color color;
  final double width;
  final double height;
  final Duration duration;

  @override
  State<GameBlinkingCursor> createState() => _GameBlinkingCursorState();
}

class _GameBlinkingCursorState extends State<GameBlinkingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat(reverse: true);
  }

  @override
  void didUpdateWidget(covariant GameBlinkingCursor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(widget.width / 2),
        ),
      ),
    );
  }
}
