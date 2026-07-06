import 'package:flutter/widgets.dart';

import '../../core/game_asset_image.dart';
import '../cards/game_operation_card.dart' show GameOperation;
import 'operations_assets.dart';

/// Maps a [GameOperation] (the canonical four-operations enum) to its bundled
/// themed label PNG.
extension GameOperationLabelAsset on GameOperation {
  /// Bundled PNG path for this operation's themed sign.
  String get labelAsset => switch (this) {
    GameOperation.addition => OperationAssets.addition,
    GameOperation.subtraction => OperationAssets.subtraction,
    GameOperation.multiplication => OperationAssets.multiplication,
    GameOperation.division => OperationAssets.division,
  };
}

/// Renders a bundled themed operation sign (addition / subtraction /
/// multiplication / division) — use as a level or section header. Reuses the
/// shared [GameOperation] enum so it stays in sync with [GameOperationCard].
/// Pass [onTap] to make it interactive (wraps in [GameAssetImage]).
class GameOperationLabel extends StatelessWidget {
  const GameOperationLabel({
    required this.operation,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.onTap,
    super.key,
  });

  final GameOperation operation;

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
    return GameAssetImage(
      assetPath: operation.labelAsset,
      size: size,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      onTap: onTap,
    );
  }
}
