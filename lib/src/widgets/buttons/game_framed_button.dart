import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_button_size.dart';
import '../../core/game_disabled_overlay.dart';
import '../../core/game_text_styles.dart';

/// A white-framed glossy blue tile button rendered entirely in Flutter.
///
/// The surface is built from a rounded white frame, a saturated blue gradient,
/// a soft diagonal sheen, a thin inset edge, and a neutral drop shadow. No
/// image asset is loaded. [child] is centered over the face and wrapped in a
/// [FittedBox] so text scales down instead of overflowing.
class GameFramedButton extends StatelessWidget {
  const GameFramedButton({
    this.size = GameButtonSize.large,
    this.child = const SizedBox.shrink(),
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    super.key,
  });

  /// Creates a framed button from a plain text value.
  ///
  /// Use the default constructor when the button needs an arbitrary [child].
  factory GameFramedButton.text(
    String text, {
    double size = GameButtonSize.large,
    TextStyle? textStyle,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
    Key? key,
  }) {
    return GameFramedButton(
      key: key,
      size: size,
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enabled,
      child: Text(
        text,
        maxLines: 1,
        style:
            textStyle ??
            GameTextStyles.displayLabel.copyWith(fontSize: size * 0.42),
      ),
    );
  }

  /// Creates a framed button from an [IconData] value.
  factory GameFramedButton.icon(
    IconData icon, {
    double size = GameButtonSize.large,
    Color color = Colors.white,
    double? iconSize,
    String? semanticLabel,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
    Key? key,
  }) {
    return GameFramedButton(
      key: key,
      size: size,
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enabled,
      child: Icon(
        icon,
        color: color,
        size: iconSize ?? size * 0.46,
        semanticLabel: semanticLabel,
      ),
    );
  }

  /// Visual edge length of the square button.
  final double size;

  /// Content centered and scaled down to fit within the blue face.
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
            _FramedButtonSurface(size: size),
            SizedBox.square(
              dimension: size * 0.68,
              child: FittedBox(fit: BoxFit.scaleDown, child: child),
            ),
          ],
        ),
      ),
    );
  }
}

class _FramedButtonSurface extends StatelessWidget {
  const _FramedButtonSurface({required this.size});

  final double size;

  static const Color _top = Color(0xFF087DFF);
  static const Color _middle = Color(0xFF0787FF);
  static const Color _bottom = Color(0xFF006EF5);
  static const Color _insetEdge = Color(0xFF005EE0);

  @override
  Widget build(BuildContext context) {
    final frameThickness = size * 0.032;
    final outerRadius = size * 0.17;
    final innerRadius = size * 0.14;
    final edgeWidth = size * 0.006;

    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(outerRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.32),
              blurRadius: size * 0.035,
              spreadRadius: size * 0.001,
              offset: Offset(0, size * 0.018),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(frameThickness),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(innerRadius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [_top, _middle, _middle, _bottom],
                      stops: [0, 0.28, 0.76, 1],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(-0.72, -1),
                      end: const Alignment(0.18, 0.22),
                      colors: [
                        Colors.white.withValues(alpha: 0.16),
                        Colors.white.withValues(alpha: 0.045),
                        Colors.transparent,
                      ],
                      stops: const [0, 0.42, 1],
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(innerRadius),
                    border: Border.all(color: _insetEdge, width: edgeWidth),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
