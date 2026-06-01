import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_button_size.dart';
import '../../core/game_disabled_overlay.dart';
import '../../core/game_ui_image.dart';
import 'buttons_assets.dart';
import 'game_button_variant.dart';

/// A game-style button. The [variant] decides what background renders
/// (bundled PNG or pure code). [GameTapScale] + [GameDisabledOverlay] handle
/// the press animation and disabled state.
///
/// [child] overlays the background, slightly shifted up to compensate for
/// the per-variant depth rim. If a PNG variant has any label baked in,
/// [child] will render *over* it — supply a blank template for fully custom
/// content.
class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    this.variant = GameButtonVariant.circle,
    this.size = GameButtonSize.medium,
    this.child = const SizedBox.shrink(),
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.tint,
  });

  final GameButtonVariant variant;
  final double size;
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  /// Optional color applied to PNG-asset variants via [BlendMode.modulate].
  /// Works best with grayscale / white-base assets. Ignored by code-rendered
  /// variants (they bake their own palette).
  final Color? tint;

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
            _backgroundFor(variant, size, tint),
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

Widget _backgroundFor(GameButtonVariant variant, double size, Color? tint) {
  return switch (variant) {
    GameButtonVariant.circle => GameUiImage.asset(
      ButtonAssets.circle,
      width: size,
      height: size,
      fit: BoxFit.contain,
      color: tint,
      colorBlendMode: tint == null ? null : BlendMode.modulate,
    ),
    GameButtonVariant.square => _SquareBackground(size: size),
  };
}

/// Code-rendered glossy squircle backdrop.
///
/// Layers, back to front:
/// 1. Outer purple-blue glow (BoxShadow).
/// 2. Dark blue depth base (full-size rounded square).
/// 3. Inner navy ring (slight inset).
/// 4. Bright blue face with radial-gradient sphere shading.
/// 5. Curved white specular highlight in the upper-left.
class _SquareBackground extends StatelessWidget {
  const _SquareBackground({required this.size});

  final double size;

  static const Color _face = Color(0xFF4A90FF);
  static const Color _depth = Color(0xFF1E5BCC);
  static const Color _innerRing = Color(0xFF0030A0);
  static const Color _highlight = Color(0xFF80C8FF);
  static const Color _shadow = Color(0xFF3070D0);
  static const Color _glow = Color(0xFF6B6BFF);

  @override
  Widget build(BuildContext context) {
    final radius = size * 0.20;
    final depthInset = size * 0.04;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(size * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                boxShadow: [
                  BoxShadow(
                    color: _glow.withValues(alpha: 0.50),
                    blurRadius: size * 0.15,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: _depth,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(depthInset * 0.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: _innerRing,
                  borderRadius: BorderRadius.circular(
                    radius - depthInset * 0.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(depthInset),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius - depthInset),
                  gradient: const RadialGradient(
                    center: Alignment(-0.2, -0.4),
                    radius: 1.2,
                    colors: [_highlight, _face, _shadow],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size * 0.14,
            left: size * 0.16,
            child: Transform.rotate(
              angle: -0.35,
              child: Container(
                width: size * 0.28,
                height: size * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(size * 0.10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
