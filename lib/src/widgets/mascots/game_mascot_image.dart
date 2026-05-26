import 'package:flutter/widgets.dart';

import '../../core/game_ui_image.dart';
import 'game_mascot.dart';
import 'mascots_assets.dart';

/// Renders a bundled [GameMascot] character in a chosen [GameMascotPose].
///
/// Backed by [Image.asset] under the hood, scoped to the package bundle —
/// works whether `game_ui` is consumed locally or pulled from pub.
class GameMascotImage extends StatelessWidget {
  const GameMascotImage({
    required this.mascot,
    this.pose = GameMascotPose.sitting,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    super.key,
  });

  final GameMascot mascot;
  final GameMascotPose pose;

  /// Convenience for square sizing (sets both [width] and [height]).
  /// Ignored when [width] or [height] is provided explicitly.
  final double? size;

  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return GameUiImage.asset(
      MascotAssets.pathFor(mascot, pose),
      width: width ?? size,
      height: height ?? size,
      fit: fit,
    );
  }
}
