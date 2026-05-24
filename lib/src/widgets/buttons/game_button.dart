import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_disabled_overlay.dart';
import '../../core/game_ui_image.dart';
import 'game_button_variant.dart';

/// A PNG-asset game-style button. The [variant] picks which bundled image
/// renders behind [child], with [GameTapScale] + [GameDisabledOverlay] wired
/// in for interaction.
///
/// [child] overlays the image, slightly shifted up to compensate for the
/// asset's bottom depth rim (controlled per-variant). If the bundled PNG has
/// any text or icon already baked in, [child] will render *over* it — supply
/// a blank-template PNG when you want fully custom content.
class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    this.variant = GameButtonVariant.circle,
    this.size = 96,
    this.child = const SizedBox.shrink(),
    this.onTap,
    this.onLongPress,
    this.enabled = true,
  });

  final GameButtonVariant variant;
  final double size;
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(
        enabled: enabled && (onTap != null || onLongPress != null),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GameUiImage.asset(
              variant.assetPath,
              width: size,
              height: size,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size * variant.faceLiftRatio),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
