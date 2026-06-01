part of 'game_tile_button.dart';

/// The rounded inner face of a [GameTileButton]: a body→lip gradient, a glossy
/// top rim, a crisp dark inset edge, and a rotated blurred corner highlight.
class _GlossFace extends StatelessWidget {
  const _GlossFace({
    required this.face,
    required this.radius,
    required this.innerSize,
    required this.child,
  });

  final Color face;
  final double radius;
  final double innerSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Glossy top rim: a bright, tight lip near the top edge.
    final rim = GameColors.lighten(face, 0.16);
    // Deep, saturated bottom lip and inset edge — a glossy tile darkens *and*
    // enriches toward the bottom, which a plain lightness drop can't reproduce.
    final lip = GameColors.deepen(face, 0.24, 0.10);
    final borderColor = GameColors.deepen(face, 0.30, 0.20);
    final borderRadius = BorderRadius.circular(radius);

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
                colors: [face, face, GameColors.darken(face, 0.10), lip],
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
              border: Border.all(color: borderColor, width: innerSize * 0.016),
            ),
          ),
          child,
          // Rotated, blurred specular highlight (top-left) — bright white so it
          // reads as a glint rather than a tinted smudge.
          Positioned(
            left: innerSize * 0.0776,
            top: innerSize * 0.0647,
            child: Transform.rotate(
              angle: -22 * math.pi / 180,
              child: ImageFiltered(
                imageFilter: ui.ImageFilter.blur(
                  sigmaX: innerSize * 0.010,
                  sigmaY: innerSize * 0.010,
                ),
                child: Container(
                  width: innerSize * 0.10,
                  height: innerSize * 0.056,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(innerSize),
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
