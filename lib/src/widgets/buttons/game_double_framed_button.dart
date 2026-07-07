import 'package:flutter/material.dart';

import '../../core/game_button_size.dart';
import '../../core/game_colors.dart';
import '../../core/game_pressable.dart';
import '../../core/game_text_styles.dart';

/// A layered square button with two contrasting frames.
///
/// The surface is rendered entirely in Flutter: a dark outer shell, a broad
/// white frame, a dark inner ring, and a softly shaded color face. [child] is
/// centered inside a [FittedBox] so it scales down instead of overflowing.
class GameDoubleFramedButton extends StatelessWidget {
  static const Color defaultBackgroundColor = Color(0xFF59BE4D);
  static const Color defaultOuterBorderColor = Color(0xFF07547D);

  const GameDoubleFramedButton({
    this.size = GameButtonSize.large,
    this.backgroundColor = defaultBackgroundColor,
    this.outerBorderColor = defaultOuterBorderColor,
    this.frameColor = Colors.white,
    this.innerBorderColor,
    this.child = const SizedBox.shrink(),
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    super.key,
  });

  /// Creates a double-framed button from a plain text value.
  factory GameDoubleFramedButton.text(
    String text, {
    double size = GameButtonSize.large,
    Color backgroundColor = defaultBackgroundColor,
    Color outerBorderColor = defaultOuterBorderColor,
    Color frameColor = Colors.white,
    Color? innerBorderColor,
    TextStyle? textStyle,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
    Key? key,
  }) {
    return GameDoubleFramedButton(
      key: key,
      size: size,
      backgroundColor: backgroundColor,
      outerBorderColor: outerBorderColor,
      frameColor: frameColor,
      innerBorderColor: innerBorderColor,
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

  /// Creates a double-framed button from an [IconData] value.
  factory GameDoubleFramedButton.icon(
    IconData icon, {
    double size = GameButtonSize.large,
    Color backgroundColor = defaultBackgroundColor,
    Color outerBorderColor = defaultOuterBorderColor,
    Color frameColor = Colors.white,
    Color? innerBorderColor,
    Color color = Colors.white,
    double? iconSize,
    String? semanticLabel,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool enabled = true,
    Key? key,
  }) {
    return GameDoubleFramedButton(
      key: key,
      size: size,
      backgroundColor: backgroundColor,
      outerBorderColor: outerBorderColor,
      frameColor: frameColor,
      innerBorderColor: innerBorderColor,
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

  final double size;
  final Color backgroundColor;
  final Color outerBorderColor;
  final Color frameColor;

  /// Inner ring color. When omitted, a dark shade is derived from
  /// [backgroundColor].
  final Color? innerBorderColor;

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GamePressable(
      onTap: onTap,
      onLongPress: onLongPress,
      enabled: enabled,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _DoubleFramedSurface(
            size: size,
            backgroundColor: backgroundColor,
            outerBorderColor: outerBorderColor,
            frameColor: frameColor,
            innerBorderColor: innerBorderColor,
          ),
          Positioned.fill(
            child: FractionallySizedBox(
              widthFactor: 0.58,
              heightFactor: 0.58,
              child: FittedBox(fit: BoxFit.scaleDown, child: child),
            ),
          ),
        ],
      ),
    );
  }
}

class _DoubleFramedSurface extends StatelessWidget {
  const _DoubleFramedSurface({
    required this.size,
    required this.backgroundColor,
    required this.outerBorderColor,
    required this.frameColor,
    required this.innerBorderColor,
  });

  final double size;
  final Color backgroundColor;
  final Color outerBorderColor;
  final Color frameColor;
  final Color? innerBorderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _DoubleFramedPainter(
          backgroundColor: backgroundColor,
          outerBorderColor: outerBorderColor,
          frameColor: frameColor,
          innerBorderColor: innerBorderColor,
        ),
      ),
    );
  }
}

class _DoubleFramedPainter extends CustomPainter {
  const _DoubleFramedPainter({
    required this.backgroundColor,
    required this.outerBorderColor,
    required this.frameColor,
    required this.innerBorderColor,
  });

  final Color backgroundColor;
  final Color outerBorderColor;
  final Color frameColor;
  final Color? innerBorderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final side = size.shortestSide;
    final outerPath = _organicSquircle(
      Rect.fromLTRB(side * 0.055, side * 0.025, side * 0.945, side * 0.985),
    );
    final framePath = _organicSquircle(
      Rect.fromLTRB(side * 0.083, side * 0.060, side * 0.917, side * 0.950),
    );
    final ringPath = _organicSquircle(
      Rect.fromLTRB(side * 0.130, side * 0.102, side * 0.880, side * 0.915),
    );
    final faceRect = Rect.fromLTRB(
      side * 0.158,
      side * 0.122,
      side * 0.852,
      side * 0.868,
    );
    final facePath = _organicSquircle(faceRect);
    final ringColor =
        innerBorderColor ?? GameColors.deepen(backgroundColor, 0.28, 0.26);

    canvas.drawShadow(
      outerPath,
      Colors.black.withValues(alpha: 0.42),
      side * 0.018,
      true,
    );
    _drawLayer(
      canvas,
      outerPath,
      fillColor: outerBorderColor,
      strokeColor: const Color(0xFF001C2C),
      strokeWidth: side * 0.005,
    );
    canvas.drawPath(framePath, Paint()..color = frameColor);
    _drawLayer(
      canvas,
      ringPath,
      fillColor: ringColor,
      strokeColor: const Color(0xFF003B08),
      strokeWidth: side * 0.004,
    );

    final facePaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.42, -0.52),
        radius: 1.30,
        colors: [
          GameColors.tint(backgroundColor, 0.16),
          backgroundColor,
          GameColors.shade(backgroundColor, 0.07),
        ],
        stops: const [0, 0.58, 1],
      ).createShader(faceRect);
    canvas.drawPath(facePath, facePaint);
    canvas.drawPath(
      facePath,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = side * 0.0025
        ..color = const Color(0xFF003B08),
    );
  }

  static void _drawLayer(
    Canvas canvas,
    Path path, {
    required Color fillColor,
    required Color strokeColor,
    required double strokeWidth,
  }) {
    canvas.drawPath(path, Paint()..color = fillColor);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = strokeColor,
    );
  }

  static Path _organicSquircle(Rect rect) {
    final left = rect.left;
    final top = rect.top;
    final right = rect.right;
    final bottom = rect.bottom;
    final width = rect.width;
    final height = rect.height;

    return Path()
      ..moveTo(left + width * 0.28, top)
      ..cubicTo(
        left + width * 0.12,
        top,
        left + width * 0.03,
        top + height * 0.07,
        left,
        top + height * 0.23,
      )
      ..cubicTo(
        left - width * 0.01,
        top + height * 0.45,
        left,
        top + height * 0.72,
        left + width * 0.04,
        top + height * 0.84,
      )
      ..cubicTo(
        left + width * 0.07,
        top + height * 0.95,
        left + width * 0.16,
        bottom,
        left + width * 0.32,
        bottom,
      )
      ..cubicTo(
        left + width * 0.52,
        bottom + height * 0.01,
        left + width * 0.72,
        bottom,
        left + width * 0.82,
        bottom - height * 0.03,
      )
      ..cubicTo(
        right - width * 0.04,
        bottom - height * 0.07,
        right,
        bottom - height * 0.16,
        right,
        bottom - height * 0.30,
      )
      ..cubicTo(
        right + width * 0.01,
        top + height * 0.52,
        right,
        top + height * 0.30,
        right - width * 0.03,
        top + height * 0.18,
      )
      ..cubicTo(
        right - width * 0.07,
        top + height * 0.06,
        right - width * 0.16,
        top,
        right - width * 0.30,
        top,
      )
      ..close();
  }

  @override
  bool shouldRepaint(covariant _DoubleFramedPainter oldDelegate) {
    return backgroundColor != oldDelegate.backgroundColor ||
        outerBorderColor != oldDelegate.outerBorderColor ||
        frameColor != oldDelegate.frameColor ||
        innerBorderColor != oldDelegate.innerBorderColor;
  }
}
