import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import 'game_spin_wheel_controller.dart';

/// A spinnable reward wheel rendered entirely in code: a gold bolted rim,
/// [segments] colored slices, and a starred gold hub.
///
/// Drive it with a [GameSpinWheelController]: `controller.spinTo(index)`
/// animates the wheel so that segment lands under the top [pointer], calling
/// [onSpinEnd] with the index when it settles. Purely visual until you spin
/// it. Segment slice colors cycle through [segmentColors].
class GameSpinWheel extends StatefulWidget {
  const GameSpinWheel({
    required this.controller,
    required this.segments,
    this.onSpinEnd,
    this.size = 280,
    this.segmentColors,
    this.spinDuration = const Duration(milliseconds: 3500),
    this.curve = Curves.easeOutCubic,
    this.pointer,
    super.key,
  }) : assert(segments > 0, 'segments must be positive');

  final GameSpinWheelController controller;

  /// Number of equal slices the wheel is divided into.
  final int segments;

  /// Called with the landed segment index when a spin settles.
  final ValueChanged<int>? onSpinEnd;

  final double size;

  /// Slice colors, cycled when there are more [segments] than colors.
  /// Defaults to a six-color candy palette.
  final List<Color>? segmentColors;

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
            child: CustomPaint(
              size: Size.square(widget.size),
              painter: _WheelPainter(
                segments: widget.segments,
                colors: widget.segmentColors ?? _WheelPainter.candy,
              ),
            ),
          ),
          ?widget.pointer,
        ],
      ),
    );
  }
}

/// Paints the wheel disc: gold rim with bolts, colored slices with gold
/// dividers, and a starred hub.
class _WheelPainter extends CustomPainter {
  const _WheelPainter({required this.segments, required this.colors});

  final int segments;
  final List<Color> colors;

  /// Default candy palette, matching the classic reward-wheel art.
  static const List<Color> candy = [
    Color(0xFFFBD540),
    Color(0xFF6BC64F),
    Color(0xFFF0568C),
    Color(0xFFF04D4D),
    Color(0xFF58ADF0),
    Color(0xFFA868E0),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2;
    final rimOuter = radius * 0.98;
    final rimInner = radius * 0.82;

    // Gold rim: annulus with a dark outer edge line.
    final rimRect = Rect.fromCircle(center: center, radius: rimOuter);
    canvas.drawPath(
      Path()
        ..fillType = PathFillType.evenOdd
        ..addOval(rimRect)
        ..addOval(Rect.fromCircle(center: center, radius: rimInner)),
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8D14A), Color(0xFFE0A81E), Color(0xFFC8860D)],
        ).createShader(rimRect),
    );
    canvas.drawCircle(
      center,
      rimOuter,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.02
        ..color = const Color(0xFF8A5A08),
    );

    // Slices.
    final sliceRect = Rect.fromCircle(center: center, radius: rimInner);
    final sweep = 2 * math.pi / segments;
    for (var i = 0; i < segments; i++) {
      // Segment 0 is centered at the top; slices proceed clockwise.
      final start = -math.pi / 2 + (i - 0.5) * sweep;
      canvas.drawArc(
        sliceRect,
        start,
        sweep,
        true,
        Paint()..color = colors[i % colors.length],
      );
      canvas.drawArc(
        sliceRect,
        start,
        sweep,
        true,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = radius * 0.015
          ..color = const Color(0xFFE0A81E),
      );
    }

    // Bolts on the rim, one per 30 degrees.
    for (var i = 0; i < 12; i++) {
      final angle = i * math.pi / 6;
      final boltCenter =
          center +
          Offset(math.cos(angle), math.sin(angle)) *
              ((rimOuter + rimInner) / 2);
      canvas.drawCircle(
        boltCenter,
        radius * 0.035,
        Paint()..color = const Color(0xFFFFE98A),
      );
      canvas.drawCircle(
        boltCenter,
        radius * 0.035,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = radius * 0.012
          ..color = const Color(0xFFA87410),
      );
    }

    // Hub: gold disc, darker ring, and a five-point star.
    canvas.drawCircle(
      center,
      radius * 0.20,
      Paint()..color = const Color(0xFFF5B92E),
    );
    canvas.drawCircle(
      center,
      radius * 0.20,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.025
        ..color = const Color(0xFFB8760A),
    );
    canvas.drawPath(
      _star(center, radius * 0.13, radius * 0.055),
      Paint()..color = const Color(0xFFFFD948),
    );
    canvas.drawPath(
      _star(center, radius * 0.13, radius * 0.055),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = radius * 0.015
        ..strokeJoin = StrokeJoin.round
        ..color = const Color(0xFFB8760A),
    );
  }

  /// Five-point star centered on [center].
  Path _star(Offset center, double outer, double inner) {
    final path = Path();
    for (var i = 0; i < 10; i++) {
      final r = i.isEven ? outer : inner;
      final angle = -math.pi / 2 + i * math.pi / 5;
      final point = center + Offset(math.cos(angle), math.sin(angle)) * r;
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _WheelPainter oldDelegate) =>
      oldDelegate.segments != segments || oldDelegate.colors != colors;
}
