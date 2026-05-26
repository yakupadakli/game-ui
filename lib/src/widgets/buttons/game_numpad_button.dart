import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_disabled_overlay.dart';

/// Visual variants of [GameNumpadButton]. The variant decides which palette
/// the button uses (digits get the calm blue palette, special keys get
/// red/orange to stand out).
enum GameNumpadButtonType { number, delete, clear }

/// A single key in a numeric pad — layered "rect button" look (depth rim +
/// gradient face + dark border + curved gloss).
///
/// Typically composed by [GameNumpad]; can be used standalone for
/// custom-shaped numpads.
class GameNumpadButton extends StatelessWidget {
  const GameNumpadButton({
    required this.value,
    required this.onTap,
    this.type = GameNumpadButtonType.number,
    this.width = 80,
    this.height = 64,
    this.enabled = true,
    super.key,
  });

  final String value;
  final VoidCallback onTap;
  final GameNumpadButtonType type;
  final double width;
  final double height;
  final bool enabled;

  // Palettes — face, depth, innerRing, highlight, shadow, stroke.
  static const _NumpadPalette _blue = _NumpadPalette(
    face: Color(0xFF4A90FF),
    depth: Color(0xFF1E5BCC),
    innerRing: Color(0xFF0030A0),
    highlight: Color(0xFF80C8FF),
    shadow: Color(0xFF3070D0),
    stroke: Color(0xFF003E91),
  );
  static const _NumpadPalette _red = _NumpadPalette(
    face: Color(0xFFE45A5A),
    depth: Color(0xFFAF2B2B),
    innerRing: Color(0xFF6B1414),
    highlight: Color(0xFFEF8A8A),
    shadow: Color(0xFFB23C3C),
    stroke: Color(0xFF691F1B),
  );
  static const _NumpadPalette _orange = _NumpadPalette(
    face: Color(0xFFFF9F43),
    depth: Color(0xFFCC7A2E),
    innerRing: Color(0xFF8A4B14),
    highlight: Color(0xFFFFBE76),
    shadow: Color(0xFFCC7A2E),
    stroke: Color(0xFF7A4A11),
  );

  _NumpadPalette get _palette => switch (type) {
    GameNumpadButtonType.number => _blue,
    GameNumpadButtonType.delete => _red,
    GameNumpadButtonType.clear => _orange,
  };

  @override
  Widget build(BuildContext context) {
    final palette = _palette;
    final radius = height * 0.22;
    final depthInset = height * 0.06;
    final fontSize = height * 0.45;

    final button = SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: palette.depth,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(depthInset * 0.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: palette.innerRing,
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
                top: depthInset * 0.5,
                left: depthInset,
                right: depthInset,
                bottom: depthInset * 1.5,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius - depthInset),
                  gradient: RadialGradient(
                    center: const Alignment(0, -0.4),
                    radius: 1.1,
                    colors: [palette.highlight, palette.face, palette.shadow],
                    stops: const [0.0, 0.55, 1.0],
                  ),
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        value,
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
                        value,
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

class _NumpadPalette {
  const _NumpadPalette({
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
