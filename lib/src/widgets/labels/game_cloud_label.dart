import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';

/// Cloud-plate variants for [GameCloudLabel]. Both render entirely in code:
/// a colored pill plate with a puffy cartoon cloud tucked over one end.
enum GameCloudLabelVariant {
  /// Red plate with the cloud over the left end (maroon cloud outline).
  cloud(
    plate: Color(0xFFF4726A),
    outline: Color(0xFF8E2B26),
    cloudOutline: Color(0xFF8E2B26),
    cloudOnLeft: true,
  ),

  /// Green plate with the cloud over the right end (steel-blue outline).
  green(
    plate: Color(0xFF90D468),
    outline: Color(0xFF57A63C),
    cloudOutline: Color(0xFF6FA8CC),
    cloudOnLeft: false,
  );

  const GameCloudLabelVariant({
    required this.plate,
    required this.outline,
    required this.cloudOutline,
    required this.cloudOnLeft,
  });

  /// Pill plate face color.
  final Color plate;

  /// Plate rim color.
  final Color outline;

  /// Cloud outline color.
  final Color cloudOutline;

  /// Which end of the plate the cloud overlaps.
  final bool cloudOnLeft;
}

/// Soft cloud-shaped plate with a centered [child] (typically a short label).
/// Pass [onTap] to make it interactive (wraps in [GameTapScale]).
class GameCloudLabel extends StatelessWidget {
  const GameCloudLabel({
    required this.child,
    this.variant = GameCloudLabelVariant.cloud,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(
      horizontal: GameDesignTokens.spacingLG,
      vertical: GameDesignTokens.spacingMD,
    ),
    this.onTap,
    super.key,
  });

  final Widget child;
  final GameCloudLabelVariant variant;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _CloudLabelPainter(variant),
        child: Center(
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }
}

/// Paints the pill plate and the puffy cloud (a union of circles) over the
/// variant's end.
class _CloudLabelPainter extends CustomPainter {
  const _CloudLabelPainter(this.variant);

  final GameCloudLabelVariant variant;

  // Cloud puffs in the cloud's unit bounding box: (cx, cy, r).
  static const List<(double, double, double)> _puffs = [
    (0.50, 0.40, 0.30),
    (0.24, 0.55, 0.22),
    (0.76, 0.55, 0.22),
    (0.38, 0.68, 0.20),
    (0.62, 0.68, 0.20),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final cloudOnLeft = variant.cloudOnLeft;

    // Plate: pill spanning most of the width, tucked under the cloud end.
    final plateRect = Rect.fromLTRB(
      cloudOnLeft ? w * 0.16 : w * 0.02,
      h * 0.14,
      cloudOnLeft ? w * 0.98 : w * 0.84,
      h * 0.86,
    );
    final plate = RRect.fromRectAndRadius(
      plateRect,
      Radius.circular(plateRect.height / 2),
    );
    final rimWidth = h * 0.055;

    // Face with a subtle top shadow so the plate reads slightly recessed.
    canvas.drawRRect(
      plate,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            GameColors.darken(variant.plate, 0.06),
            variant.plate,
            GameColors.darken(variant.plate, 0.04),
          ],
          stops: const [0.0, 0.35, 1.0],
        ).createShader(plateRect),
    );
    canvas.drawRRect(
      plate,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = rimWidth
        ..color = variant.outline,
    );

    // Cloud: union of circles over the variant's end, outlined then filled.
    final cloudSide = h * 1.0;
    final cloudRect = Rect.fromLTWH(
      cloudOnLeft ? 0 : w - cloudSide * 1.3,
      0,
      cloudSide * 1.3,
      cloudSide,
    );
    final cloud = _cloudPath(cloudRect);

    canvas.drawPath(
      cloud,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = h * 0.06
        ..color = variant.cloudOutline
        ..strokeJoin = StrokeJoin.round,
    );
    canvas.drawPath(
      cloud,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFFFFF), Color(0xFFFDFEFF), Color(0xFFCFE2F0)],
          stops: [0.0, 0.55, 1.0],
        ).createShader(cloudRect),
    );
  }

  Path _cloudPath(Rect box) {
    Path? cloud;
    for (final (cx, cy, r) in _puffs) {
      final puff = Path()
        ..addOval(
          Rect.fromCircle(
            center: Offset(
              box.left + cx * box.width,
              box.top + cy * box.height,
            ),
            radius: r * box.height,
          ),
        );
      cloud = cloud == null
          ? puff
          : Path.combine(PathOperation.union, cloud, puff);
    }
    return cloud!;
  }

  @override
  bool shouldRepaint(covariant _CloudLabelPainter oldDelegate) =>
      oldDelegate.variant != variant;
}
