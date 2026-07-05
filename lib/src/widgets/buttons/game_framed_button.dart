import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_button_size.dart';
import '../../core/game_disabled_overlay.dart';
import '../../core/game_text_styles.dart';

/// A white-framed glossy blue tile button rendered entirely in Flutter.
///
/// The surface is built from a rounded white frame, a saturated blue gradient,
/// a thin dark outer outline, a soft diagonal sheen, a thin inset edge, and a
/// neutral drop shadow. No image asset is loaded. [child] is centered over the
/// face and wrapped in a [FittedBox] so text scales down instead of overflowing.
class GameFramedButton extends StatelessWidget {
  static const Color defaultBackgroundColor = Color(0xFF0787FF);

  const GameFramedButton({
    this.size = GameButtonSize.large,
    this.backgroundColor = defaultBackgroundColor,
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
    Color backgroundColor = defaultBackgroundColor,
    TextStyle? textStyle,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
    Key? key,
  }) {
    return GameFramedButton(
      key: key,
      size: size,
      backgroundColor: backgroundColor,
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
    Color backgroundColor = defaultBackgroundColor,
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
      backgroundColor: backgroundColor,
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

  /// Base color used to derive the glossy face gradient and inset edge.
  final Color backgroundColor;

  /// Content centered and scaled down to fit within the blue face.
  final Widget child;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return _GameFramedButtonBase(
      width: size,
      height: size,
      contentWidthFactor: 0.68,
      contentHeightFactor: 0.68,
      backgroundColor: backgroundColor,
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enabled,
      child: child,
    );
  }
}

/// Preset dimensions for [GameFramedWideButton].
enum GameFramedWideButtonSize {
  small(width: 160, height: 56),
  medium(width: 220, height: 64),
  large(width: 280, height: 72),

  /// Uses all horizontal space supplied by a width-constrained parent.
  full(width: double.infinity, height: 72);

  const GameFramedWideButtonSize({required this.width, required this.height});

  final double width;
  final double height;
}

/// A wide rectangular counterpart to [GameFramedButton].
///
/// It uses the same code-rendered white frame and glossy blue face while
/// using dimensions from [size]. Use the default
/// constructor for arbitrary content, or [GameFramedWideButton.text] and
/// [GameFramedWideButton.icon] for common cases.
class GameFramedWideButton extends StatelessWidget {
  const GameFramedWideButton({
    this.size = GameFramedWideButtonSize.medium,
    this.backgroundColor = GameFramedButton.defaultBackgroundColor,
    this.child = const SizedBox.shrink(),
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    super.key,
  });

  /// Creates a wide framed button from a plain text value.
  factory GameFramedWideButton.text(
    String text, {
    GameFramedWideButtonSize size = GameFramedWideButtonSize.medium,
    Color backgroundColor = GameFramedButton.defaultBackgroundColor,
    TextStyle? textStyle,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
    Key? key,
  }) {
    return GameFramedWideButton(
      key: key,
      size: size,
      backgroundColor: backgroundColor,
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enabled,
      child: Text(
        text,
        maxLines: 1,
        style:
            textStyle ??
            GameTextStyles.displayLabel.copyWith(fontSize: size.height * 0.42),
      ),
    );
  }

  /// Creates a wide framed button from an [IconData] value.
  factory GameFramedWideButton.icon(
    IconData icon, {
    GameFramedWideButtonSize size = GameFramedWideButtonSize.medium,
    Color backgroundColor = GameFramedButton.defaultBackgroundColor,
    Color color = Colors.white,
    double? iconSize,
    String? semanticLabel,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
    Key? key,
  }) {
    return GameFramedWideButton(
      key: key,
      size: size,
      backgroundColor: backgroundColor,
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enabled,
      child: Icon(
        icon,
        color: color,
        size: iconSize ?? size.height * 0.46,
        semanticLabel: semanticLabel,
      ),
    );
  }

  final GameFramedWideButtonSize size;

  /// Base color used to derive the glossy face gradient and inset edge.
  final Color backgroundColor;

  /// Content centered and scaled down to fit within the blue face.
  final Widget child;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return _GameFramedButtonBase(
      width: size.width,
      height: size.height,
      contentWidthFactor: 0.78,
      contentHeightFactor: 0.62,
      backgroundColor: backgroundColor,
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enabled,
      child: child,
    );
  }
}

class _GameFramedButtonBase extends StatelessWidget {
  const _GameFramedButtonBase({
    required this.width,
    required this.height,
    required this.contentWidthFactor,
    required this.contentHeightFactor,
    required this.backgroundColor,
    required this.child,
    required this.enabled,
    this.onTap,
    this.onLongPress,
  });

  final double width;
  final double height;
  final double contentWidthFactor;
  final double contentHeightFactor;
  final Color backgroundColor;
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(
        scaleDown: 0.86,
        enabled: enabled && (onTap != null || onLongPress != null),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _FramedButtonSurface(
              width: width,
              height: height,
              backgroundColor: backgroundColor,
            ),
            Positioned.fill(
              child: FractionallySizedBox(
                widthFactor: contentWidthFactor,
                heightFactor: contentHeightFactor,
                child: FittedBox(fit: BoxFit.scaleDown, child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FramedButtonSurface extends StatelessWidget {
  const _FramedButtonSurface({
    required this.width,
    required this.height,
    required this.backgroundColor,
  });

  final double width;
  final double height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final frameThickness = height * 0.05;
    final outerRadius = height * 0.17;
    final innerRadius = height * 0.14;
    final edgeWidth = height * 0.006;
    final top = Color.lerp(backgroundColor, Colors.white, 0.08)!;
    final bottom = Color.lerp(backgroundColor, Colors.black, 0.14)!;
    final insetEdge = Color.lerp(backgroundColor, Colors.black, 0.24)!;

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(outerRadius),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.75),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.32),
              blurRadius: height * 0.035,
              spreadRadius: height * 0.001,
              offset: Offset(0, height * 0.018),
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
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [top, backgroundColor, backgroundColor, bottom],
                      stops: const [0, 0.28, 0.76, 1],
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
                    border: Border.all(color: insetEdge, width: edgeWidth),
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
