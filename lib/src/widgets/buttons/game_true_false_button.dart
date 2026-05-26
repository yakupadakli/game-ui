import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_disabled_overlay.dart';

/// Paired true/false answer button — green when [isTrue], red otherwise.
///
/// Used in two-up rows for boolean answer questions. Pass [isSelected] to
/// indicate the player's current pick (renders a thicker outer ring).
class GameTrueFalseButton extends StatelessWidget {
  const GameTrueFalseButton({
    required this.text,
    required this.isTrue,
    required this.onTap,
    this.isSelected = false,
    this.width = 160,
    this.height = 72,
    this.enabled = true,
    super.key,
  });

  final String text;
  final bool isTrue;
  final bool isSelected;
  final VoidCallback onTap;
  final double width;
  final double height;
  final bool enabled;

  static const _TruePalette _truePalette = _TruePalette(
    face: Color(0xFF8BC53D),
    depth: Color(0xFF2C4F2E),
    innerRing: Color(0xFF335815),
    highlight: Color(0xFFB3D779),
    shadow: Color(0xFF5C9628),
    stroke: Color(0xFF335815),
  );

  static const _TruePalette _falsePalette = _TruePalette(
    face: Color(0xFFF14D4C),
    depth: Color(0xFF8A1414),
    innerRing: Color(0xFF691F1B),
    highlight: Color(0xFFF87E73),
    shadow: Color(0xFFAF2B2B),
    stroke: Color(0xFF691F1B),
  );

  @override
  Widget build(BuildContext context) {
    final palette = isTrue ? _truePalette : _falsePalette;
    final radius = height * 0.30;
    final depthInset = height * 0.07;
    final fontSize = height * 0.42;

    final button = SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected ? palette.depth : Colors.white,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(depthInset * 0.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: palette.depth,
                  borderRadius: BorderRadius.circular(
                    radius - depthInset * 0.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                top: depthInset,
                left: depthInset * 1.4,
                right: depthInset * 1.4,
                bottom: depthInset * 2,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius - depthInset),
                  gradient: RadialGradient(
                    center: const Alignment(0, -0.4),
                    radius: 1.15,
                    colors: [palette.highlight, palette.face, palette.shadow],
                    stops: const [0.0, 0.55, 1.0],
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isTrue ? Icons.check_circle : Icons.cancel,
                        color: Colors.white,
                        size: fontSize,
                      ),
                      SizedBox(width: fontSize * 0.25),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            text,
                            style: TextStyle(
                              fontFamily: 'BalooChettan2',
                              fontSize: fontSize,
                              fontWeight: FontWeight.w800,
                              height: 1.0,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = fontSize * 0.10
                                ..strokeJoin = StrokeJoin.round
                                ..color = palette.stroke,
                            ),
                          ),
                          Text(
                            text,
                            style: TextStyle(
                              fontFamily: 'BalooChettan2',
                              fontSize: fontSize,
                              fontWeight: FontWeight.w800,
                              height: 1.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(enabled: enabled, onTap: onTap, child: button),
    );
  }
}

class _TruePalette {
  const _TruePalette({
    required this.face,
    required this.depth,
    required this.innerRing,
    required this.highlight,
    required this.shadow,
    required this.stroke,
  });

  final Color face;
  final Color depth;
  final Color innerRing;
  final Color highlight;
  final Color shadow;
  final Color stroke;
}
