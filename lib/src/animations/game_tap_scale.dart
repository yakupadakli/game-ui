import 'package:flutter/material.dart';

/// Wraps [child] with a press-down scale animation.
///
/// When [enabled] is false the child is returned as-is with no
/// [GestureDetector] or animation overhead.
///
/// Set [onLongPress] to receive long-press callbacks; the scale stays pressed
/// for the duration of the long press and reverses on release. When
/// [enableFeedback] is true, [Feedback.forTap] / [Feedback.forLongPress] is
/// invoked on activation (platform haptic / click).
class GameTapScale extends StatefulWidget {
  const GameTapScale({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.scaleDown = 0.95,
    this.duration = const Duration(milliseconds: 100),
    this.enabled = true,
    this.enableFeedback = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double scaleDown;
  final Duration duration;
  final bool enabled;

  /// When true, plays platform feedback (haptic / click) on tap and long press.
  final bool enableFeedback;

  @override
  State<GameTapScale> createState() => _GameTapScaleState();
}

class _GameTapScaleState extends State<GameTapScale>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _buildAnimation();
  }

  @override
  void didUpdateWidget(covariant GameTapScale oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    if (oldWidget.scaleDown != widget.scaleDown) {
      _buildAnimation();
    }

    if (!widget.enabled && _controller.isAnimating) {
      _controller.reset();
    }
  }

  void _buildAnimation() {
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleDown,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  void _handleTap() {
    if (widget.enableFeedback) {
      Feedback.forTap(context);
    }
    widget.onTap?.call();
  }

  void _handleLongPressStart(LongPressStartDetails details) {
    _controller.forward();
  }

  void _handleLongPressEnd(LongPressEndDetails details) {
    _controller.reverse();
  }

  void _handleLongPress() {
    if (widget.enableFeedback) {
      Feedback.forLongPress(context);
    }
    widget.onLongPress?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: widget.onTap == null ? null : _handleTap,
      onLongPress: widget.onLongPress == null ? null : _handleLongPress,
      onLongPressStart: widget.onLongPress == null
          ? null
          : _handleLongPressStart,
      onLongPressEnd: widget.onLongPress == null ? null : _handleLongPressEnd,
      child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
    );
  }
}
