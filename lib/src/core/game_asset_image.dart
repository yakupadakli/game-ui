import 'package:flutter/widgets.dart';

import '../animations/game_tap_scale.dart';
import 'game_ui_image.dart';

/// Renders a bundled PNG with the conventions shared by every asset-backed
/// illustration widget in `game_ui` ([GameAvatarImage], [GameAwardImage],
/// [GameTreasureImage], …):
///
/// * [size] is a convenience that fills both [width] and [height]; an explicit
///   [width]/[height] always wins.
/// * an optional [child] is centered over the image (e.g. a streak count).
/// * when [onTap] is non-null the whole thing is wrapped in [GameTapScale] so
///   it presses like the rest of the library.
///
/// Category widgets stay thin, type-safe wrappers (their enum plus a delegating
/// [build]); this class holds the single real implementation so a future change
/// — placeholder, hero, error handling — lands in one place instead of ~14.
class GameAssetImage extends StatelessWidget {
  const GameAssetImage({
    required this.asset,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.child,
    this.onTap,
    super.key,
  });

  /// Package-relative PNG path (e.g. `assets/images/awards/medal_gold.png`).
  final String asset;

  /// Convenience square sizing (sets both [width] and [height]). Ignored when
  /// [width] or [height] is set explicitly.
  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;

  /// Drops the image from the semantics tree — for ambient scenery that carries
  /// no meaningful label.
  final bool excludeFromSemantics;

  /// Optional overlay centered on top of the image.
  final Widget? child;

  /// When non-null, wraps the result in [GameTapScale] for a press animation.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget content = GameUiImage.asset(
      asset,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
    if (child != null) {
      content = Stack(alignment: Alignment.center, children: [content, child!]);
    }
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }
}
