import 'package:flutter/material.dart';

import '../../core/game_colors.dart';

/// Animated correct/wrong overlay — a circle that bounces in, holds, then
/// fades out. Used inline (e.g. centered on the answer field) or as a
/// full-screen overlay via [showGameFeedbackOverlay].
class GameFeedbackOverlay extends StatefulWidget {
  const GameFeedbackOverlay({
    required this.isCorrect,
    this.onAnimationComplete,
    this.correctColor = GameColors.success,
    this.wrongColor = GameColors.danger,
    this.correctIcon = Icons.check_circle,
    this.wrongIcon = Icons.cancel,
    this.size = 120.0,
    this.iconSize = 70.0,
    this.duration = const Duration(milliseconds: 600),
    super.key,
  });

  final bool isCorrect;
  final VoidCallback? onAnimationComplete;
  final Color correctColor;
  final Color wrongColor;
  final IconData correctIcon;
  final IconData wrongIcon;
  final double size;
  final double iconSize;
  final Duration duration;

  @override
  State<GameFeedbackOverlay> createState() => _GameFeedbackOverlayState();
}

class _GameFeedbackOverlayState extends State<GameFeedbackOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 20),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 30),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward().then((_) {
      if (mounted) widget.onAnimationComplete?.call();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.isCorrect ? widget.correctColor : widget.wrongColor;
    final icon = widget.isCorrect ? widget.correctIcon : widget.wrongIcon;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.scale(
            scale: _scale.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: widget.iconSize),
            ),
          ),
        );
      },
    );
  }
}

/// Inserts a full-screen [GameFeedbackOverlay] via the current [Overlay] and
/// removes it when the animation completes.
void showGameFeedbackOverlay(
  BuildContext context, {
  required bool isCorrect,
  Color? correctColor,
  Color? wrongColor,
  IconData? correctIcon,
  IconData? wrongIcon,
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: GameFeedbackOverlay(
            isCorrect: isCorrect,
            correctColor: correctColor ?? GameColors.success,
            wrongColor: wrongColor ?? GameColors.danger,
            correctIcon: correctIcon ?? Icons.check_circle,
            wrongIcon: wrongIcon ?? Icons.cancel,
            onAnimationComplete: () => entry.remove(),
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);
}
