import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import 'game_mascot.dart';
import 'mascots_assets.dart';

/// Renders a bundled [GameMascot] character in a chosen [GameMascotPose].
///
/// Backed by [Image.asset] under the hood, scoped to the package bundle —
/// works whether `game_ui` is consumed locally or pulled from pub.
///
/// Use the default constructor for the shared cross-mascot poses, or
/// [GameMascotImage.bear] for the bear-only [GameBearPose] set.
class GameMascotImage extends StatelessWidget {
  const GameMascotImage({
    required this.mascot,
    this.pose = GameMascotPose.sitting,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    super.key,
  }) : bearPose = null;

  /// Renders a bear-only pose — poses that exist only for [GameMascot.bear]
  /// and are not part of the shared [GameMascotPose] set.
  const GameMascotImage.bear({
    required GameBearPose pose,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    super.key,
  }) : mascot = GameMascot.bear,
       pose = GameMascotPose.sitting,
       bearPose = pose;

  final GameMascot mascot;
  final GameMascotPose pose;

  /// Set by [GameMascotImage.bear]; when non-null, the widget resolves a
  /// bear-only asset and [pose] is ignored.
  final GameBearPose? bearPose;

  /// Convenience for square sizing (sets both [width] and [height]).
  /// Ignored when [width] or [height] is provided explicitly.
  final double? size;

  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final pose = bearPose;
    final asset = pose != null
        ? MascotAssets.bearPath(pose)
        : MascotAssets.pathFor(mascot, this.pose);
    return GameAssetImage(
      asset: asset,
      size: size,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
