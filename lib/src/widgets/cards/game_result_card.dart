import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../indicators/game_star_rating.dart';

/// End-of-level summary card — a white panel with [GameStarRating] floating
/// off the top edge and four optional slots inside:
/// [title], [subtitle], [badge], and a [stats] row.
///
/// All slots are optional so the card can render anything from a minimal
/// "stars + score" pop-up to a full breakdown (stars, title, subtitle,
/// difficulty badge, stat tiles).
class GameResultCard extends StatelessWidget {
  const GameResultCard({
    required this.starCount,
    this.maxStars = 3,
    this.title,
    this.subtitle,
    this.badge,
    this.stats,
    this.starSize = 60.0,
    this.starRow,
    this.color = Colors.white,
    this.borderColor = GameColors.border,
    this.borderWidth = 3.0,
    this.borderRadius = GameDesignTokens.radiusLG,
    this.margin = const EdgeInsets.symmetric(
      horizontal: GameDesignTokens.spacingMD,
    ),
    super.key,
  });

  final int starCount;
  final int maxStars;
  final Widget? title;
  final Widget? subtitle;
  final Widget? badge;
  final Widget? stats;
  final double starSize;

  /// Override the default [GameStarRating] entirely (e.g. swap the Material
  /// star for an illustrated PNG via a [GameStarRating.iconBuilder]).
  final Widget? starRow;

  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final Widget stars =
        starRow ??
        GameStarRating(
          starCount: starCount,
          maxStars: maxStars,
          size: starSize,
        );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: starSize / 2).add(margin),
          padding: EdgeInsets.only(
            top: starSize / 2 + GameDesignTokens.spacingLG,
            left: GameDesignTokens.spacingMD,
            right: GameDesignTokens.spacingMD,
            bottom: GameDesignTokens.spacingMD,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ?title,
              if (subtitle != null) ...[
                const SizedBox(height: GameDesignTokens.spacingXS),
                subtitle!,
              ],
              if (badge != null) ...[
                const SizedBox(height: GameDesignTokens.spacingSM),
                badge!,
              ],
              if (stats != null) ...[
                const SizedBox(height: GameDesignTokens.spacingMD),
                stats!,
              ],
            ],
          ),
        ),
        Positioned(top: 0, child: stars),
      ],
    );
  }
}
