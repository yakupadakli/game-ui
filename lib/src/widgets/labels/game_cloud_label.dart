import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_ui_image.dart';
import 'labels_assets.dart';

/// Cloud-plate variants for [GameCloudLabel] — matches [LabelAssets].
enum GameCloudLabelVariant {
  cloud(asset: LabelAssets.cloud),
  green(asset: LabelAssets.cloudGreen);

  const GameCloudLabelVariant({required this.asset});

  /// Bundled PNG path for this cloud plate.
  final String asset;
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
    final content = Stack(
      alignment: Alignment.center,
      children: [
        GameUiImage.asset(
          variant.asset,
          width: width,
          height: height,
          fit: BoxFit.fill,
        ),
        Padding(padding: padding, child: child),
      ],
    );
    if (onTap == null) return content;
    return GameTapScale(onTap: onTap, child: content);
  }
}
