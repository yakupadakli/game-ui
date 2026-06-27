import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
import 'avatars_assets.dart';

/// Bundled avatar faces — matches the PNGs in [AvatarAssets].
enum GameAvatar {
  faceBoy(asset: AvatarAssets.faceBoy),
  faceGirl(asset: AvatarAssets.faceGirl);

  const GameAvatar({required this.asset});

  /// Bundled PNG path for this avatar face.
  final String asset;
}

/// Renders a bundled avatar face PNG. Compose inside [GameAvatarItem] for a
/// selectable picker, or pass [onTap] here for a simple tappable face.
class GameAvatarImage extends StatelessWidget {
  const GameAvatarImage({
    required this.avatar,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameAvatar avatar;

  /// Convenience square sizing (sets both [width] and [height]). Ignored when
  /// [width] or [height] is set explicitly.
  final double? size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = GameUiImage.asset(
      avatar.asset,
      width: width ?? size,
      height: height ?? size,
      fit: fit,
      semanticLabel: semanticLabel,
    );
    if (onTap == null) return image;
    return GameTapScale(onTap: onTap, child: image);
  }
}
