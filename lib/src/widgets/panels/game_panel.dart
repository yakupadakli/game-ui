import 'package:flutter/widgets.dart';

import '../../core/constants.dart' show gameUiPackageName;
import '../../core/game_design_tokens.dart';
import 'panels_assets.dart';

/// Framed-panel variants for [GamePanel].
///
/// [cardBlue] and [answerBox] render entirely in code (layered rims + a
/// radial-gradient well); [woodBoard] keeps its illustrated PNG — hand-drawn
/// wood grain and vines aren't reproducible in code.
enum GamePanelVariant { cardBlue, answerBox, woodBoard }

/// A framed content panel — answer boxes, blue cards, wooden boards. The
/// frame carries the shape and rim, so the wrapper needs no border of its own.
class GamePanel extends StatelessWidget {
  const GamePanel({
    required this.child,
    this.variant = GamePanelVariant.cardBlue,
    this.padding = const EdgeInsets.all(GameDesignTokens.spacingLG),
    this.width,
    this.height,
    super.key,
  });

  final Widget child;
  final GamePanelVariant variant;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return switch (variant) {
      GamePanelVariant.woodBoard => Container(
        width: width,
        height: height,
        padding: padding,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              PanelAssets.woodBoardVine,
              package: gameUiPackageName,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
      GamePanelVariant.cardBlue => _CodePanel(
        width: width,
        height: height,
        padding: padding,
        spec: _PanelSpec.cardBlue,
        child: child,
      ),
      GamePanelVariant.answerBox => _CodePanel(
        width: width,
        height: height,
        padding: padding,
        spec: _PanelSpec.answerBox,
        child: child,
      ),
    };
  }
}

/// Colors + metrics for one code-rendered panel look.
class _PanelSpec {
  const _PanelSpec({
    required this.rimTop,
    required this.rimBottom,
    required this.band,
    required this.wellCenter,
    required this.wellMid,
    required this.wellEdge,
    this.glow,
    this.gloss = false,
  });

  /// Outer rim gradient (top → bottom).
  final Color rimTop;
  final Color rimBottom;

  /// Light band between the rim and the interior well.
  final Color band;

  /// Radial interior: dark center → mid tone → light edge.
  final Color wellCenter;
  final Color wellMid;
  final Color wellEdge;

  /// Optional soft outer glow.
  final Color? glow;

  /// Whether to paint a specular blob in the top-left corner.
  final bool gloss;

  /// Deep blue card: blue rim, pale band, slate well.
  static const cardBlue = _PanelSpec(
    rimTop: Color(0xFF4A90B8),
    rimBottom: Color(0xFF2D6E94),
    band: Color(0xFFD6E9F2),
    wellCenter: Color(0xFF33424B),
    wellMid: Color(0xFF5E7886),
    wellEdge: Color(0xFFA9C4D2),
  );

  /// Bright cyan answer box: white rim, glowing edge, steel-blue well.
  static const answerBox = _PanelSpec(
    rimTop: Color(0xFFFFFFFF),
    rimBottom: Color(0xFFEAF7FC),
    band: Color(0xFFA8DEF0),
    wellCenter: Color(0xFF4E86A0),
    wellMid: Color(0xFF7FB2C8),
    wellEdge: Color(0xFFE8F6FB),
    glow: Color(0xFF7FD4EE),
    gloss: true,
  );
}

/// Layered code-rendered panel: rim → band → radial well → content.
class _CodePanel extends StatelessWidget {
  const _CodePanel({
    required this.spec,
    required this.padding,
    required this.child,
    this.width,
    this.height,
  });

  final _PanelSpec spec;
  final EdgeInsetsGeometry padding;
  final Widget child;
  final double? width;
  final double? height;

  static const double _radius = 24;
  static const double _rimWidth = 6;
  static const double _bandWidth = 5;

  @override
  Widget build(BuildContext context) {
    final glow = spec.glow;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_radius),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [spec.rimTop, spec.rimBottom],
        ),
        boxShadow: [
          if (glow != null)
            BoxShadow(
              color: glow.withValues(alpha: 0.55),
              blurRadius: 12,
              spreadRadius: 2,
            ),
        ],
      ),
      padding: const EdgeInsets.all(_rimWidth),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: spec.band,
          borderRadius: BorderRadius.circular(_radius - _rimWidth),
        ),
        child: Padding(
          padding: const EdgeInsets.all(_bandWidth),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              _radius - _rimWidth - _bandWidth,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        radius: 1.2,
                        colors: [spec.wellCenter, spec.wellMid, spec.wellEdge],
                        stops: const [0.0, 0.55, 1.0],
                      ),
                    ),
                  ),
                ),
                if (spec.gloss)
                  Positioned(
                    top: 8,
                    left: 14,
                    child: Transform.rotate(
                      angle: -0.5,
                      child: Container(
                        width: 42,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                Padding(padding: padding, child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
