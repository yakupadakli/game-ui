import 'package:flutter/widgets.dart';

import '../animations/game_tap_scale.dart';
import 'game_ui_image.dart';

/// Shared body of the `Game*Image` widgets (coins, items, avatars, flags,
/// treasures, mascots, …): renders one bundled PNG with the common
/// size / width / height / fit / semantics / tap conventions.
///
/// The per-category widgets stay the public API — they carry the typed enum
/// (e.g. `GameCoin`) and resolve it to [assetPath] before delegating here.
///
/// - [size] is convenience square sizing; explicit [width] / [height] win.
/// - Without a [semanticLabel] the image is excluded from semantics
///   (decorative); with one it announces as an image.
/// - [onTap] wraps the image in a [GameTapScale] so the press is felt.
/// - [overlay] stacks centered content over the image (e.g. a streak count).
class GameAssetImage extends StatelessWidget {
  const GameAssetImage({
    required this.assetPath,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    this.overlay,
    super.key,
  });

  /// Bundle-relative PNG path (an `*_assets.dart` constant).
  final String assetPath;

  /// Convenience square sizing (sets both [width] and [height]). Ignored when
  /// [width] or [height] is set explicitly.
  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;
  final VoidCallback? onTap;

  /// Optional content stacked centered over the image.
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    final image = GameUiImage.asset(
      assetPath,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
      excludeFromSemantics: semanticLabel == null,
    );
    final content = overlay == null
        ? image
        : Stack(alignment: Alignment.center, children: [image, overlay!]);
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }
}
