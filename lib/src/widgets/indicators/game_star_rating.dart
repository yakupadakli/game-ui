import 'package:flutter/material.dart';

/// Row of star icons showing [starCount] earned out of [maxStars].
///
/// Earned and unearned stars render with separate opacity values; pass a
/// custom [icon] (or [iconBuilder] for full control) to override the bundled
/// material star.
class GameStarRating extends StatelessWidget {
  const GameStarRating({
    required this.starCount,
    this.maxStars = 3,
    this.size = 36.0,
    this.earnedOpacity = 1.0,
    this.unearnedOpacity = 0.3,
    this.icon = Icons.star_rounded,
    this.earnedColor = const Color(0xFFFFC107),
    this.unearnedColor = const Color(0xFFFFC107),
    this.spacing = 4.0,
    this.iconBuilder,
    super.key,
  });

  final int starCount;
  final int maxStars;
  final double size;
  final double earnedOpacity;
  final double unearnedOpacity;
  final IconData icon;
  final Color earnedColor;
  final Color unearnedColor;
  final double spacing;

  /// Optional builder for fully custom star widgets (e.g. PNG asset).
  /// Signature: `(BuildContext, indexZeroBased, isEarned) → Widget`.
  final Widget Function(BuildContext, int, bool)? iconBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        final isEarned = index < starCount;
        final star =
            iconBuilder?.call(context, index, isEarned) ??
            Icon(
              icon,
              size: size,
              color: isEarned ? earnedColor : unearnedColor,
            );
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: Opacity(
            opacity: isEarned ? earnedOpacity : unearnedOpacity,
            child: star,
          ),
        );
      }),
    );
  }
}
