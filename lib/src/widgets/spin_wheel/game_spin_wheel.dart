import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../core/game_ui_image.dart';
import 'game_spin_wheel_controller.dart';
import 'spin_wheel_assets.dart';

/// A spinnable reward wheel backed by the bundled wheel PNG.
///
/// Divide the art into [segments] equal slices, then drive it with a
/// [GameSpinWheelController]: `controller.spinTo(index)` animates the wheel so
/// that segment lands under the top [pointer], calling [onSpinEnd] with the
/// index when it settles. Purely visual until you spin it.
class GameSpinWheel extends StatefulWidget {
  const GameSpinWheel({
    required this.controller,
    required this.segments,
    this.onSpinEnd,
    this.size = 280,
    this.asset = SpinWheelAssets.wheel,
    this.spinDuration = const Duration(milliseconds: 3500),
    this.curve = Curves.easeOutCubic,
    this.pointer,
    super.key,
  }) : assert(segments > 0, 'segments must be positive');

  final GameSpinWheelController controller;

  /// Number of equal slices the wheel art is divided into.
  final int segments;

  /// Called with the landed segment index when a spin settles.
  final ValueChanged<int>? onSpinEnd;

  final double size;
  final String asset;
  final Duration spinDuration;
  final Curve curve;

  /// Optional marker drawn at the top, centered on the rim (defaults to none).
  final Widget? pointer;

  @override
  State<GameSpinWheel> createState() => _GameSpinWheelState();
}

class _GameSpinWheelState extends State<GameSpinWheel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ac = AnimationController(
    vsync: this,
    duration: widget.spinDuration,
  );

  /// Current resting rotation, in turns (1 turn == 2π).
  double _restTurns = 0;
  Animation<double> _turns = const AlwaysStoppedAnimation<double>(0);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(GameSpinWheel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onControllerChanged);
      widget.controller.addListener(_onControllerChanged);
    }
    _ac.duration = widget.spinDuration;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    _ac.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    final index = widget.controller.pendingIndex;
    if (index == null || _ac.isAnimating) return;
    _spinTo(index, widget.controller.extraTurns);
  }

  void _spinTo(int index, int extraTurns) {
    final segments = widget.segments;
    final i = index % segments;

    // Fraction of a turn that places segment i under the top pointer. The wheel
    // turns clockwise, so a segment at clockwise offset i lands on top after
    // rotating (segments - i) / segments of a turn.
    final landing = ((segments - i) % segments) / segments;

    final base = _restTurns.floorToDouble();
    final target = base + extraTurns + landing;

    _turns = Tween<double>(
      begin: _restTurns,
      end: target,
    ).animate(CurvedAnimation(parent: _ac, curve: widget.curve));

    _ac.forward(from: 0).then((_) {
      if (!mounted) return;
      _restTurns = target;
      widget.onSpinEnd?.call(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedBuilder(
            // Listen to the stable controller, not the reassignable [_turns]
            // tween — [_spinTo] swaps [_turns] without a rebuild, and the
            // controller is what actually ticks during a spin.
            animation: _ac,
            builder: (context, child) => Transform.rotate(
              angle: _turns.value * 2 * math.pi,
              child: child,
            ),
            child: GameUiImage.asset(
              widget.asset,
              width: widget.size,
              height: widget.size,
              fit: BoxFit.contain,
            ),
          ),
          ?widget.pointer,
        ],
      ),
    );
  }
}
