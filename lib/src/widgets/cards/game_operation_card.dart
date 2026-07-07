import 'package:flutter/widgets.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../../core/game_gloss_surface.dart';
import '../../core/game_pressable.dart';
import '../mascots/game_mascot.dart';
import '../mascots/game_mascot_image.dart';
import '../text/game_stroked_text.dart';

/// The four arithmetic operations a [GameOperationCard] can represent. Each
/// pairs a mascot with a glossy face color and the operator glyph, mirroring
/// the design guide (addition → bear/green, subtraction → penguin/red,
/// multiplication → fox/yellow, division → elephant/blue).
enum GameOperation {
  addition(mascot: GameMascot.bear, color: GameColors.grassGreen, symbol: '+'),
  subtraction(
    mascot: GameMascot.penguin,
    color: GameColors.friendlyCoral,
    symbol: '−',
  ),
  multiplication(
    mascot: GameMascot.fox,
    color: GameColors.sunnyYellow,
    symbol: '×',
  ),
  division(
    mascot: GameMascot.elephant,
    color: GameColors.vibrantBlue,
    symbol: '÷',
  );

  const GameOperation({
    required this.mascot,
    required this.color,
    required this.symbol,
  });

  /// Mascot paired with this operation (bear / penguin / fox / elephant).
  final GameMascot mascot;

  /// Default glossy face color for the card.
  final Color color;

  /// The math operator glyph (`+`, `−`, `×`, `÷`).
  final String symbol;
}

/// A horizontal glossy "operation island" card: a circular mascot badge on the
/// left, a stroked [title] and a muted [subtitle] on the right, over a
/// color-coded [GameGlossSurface] pill.
///
/// The [operation] picks the mascot and the default face [color] (override
/// [color] for a custom hue). The mascot badge spans the full [height] and pops
/// slightly above and below the pill, so keep the card clear of tight clips.
/// Press scale and the disabled state come from [GamePressable].
class GameOperationCard extends StatelessWidget {
  const GameOperationCard({
    required this.operation,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.color,
    this.height = 72,
    this.enabled = true,
    super.key,
  });

  final GameOperation operation;

  /// Island name shown as the stroked headline (e.g. `'Toplama Adası'`).
  final String title;

  /// Secondary line beneath the title (e.g. `'Seviye 8'`).
  final String subtitle;

  /// Tap callback. The card is interactive only when [onTap] is non-null *and*
  /// [enabled] is true; otherwise it renders dimmed and ignores input.
  final VoidCallback? onTap;

  /// Overrides [GameOperation.color] for the glossy pill face.
  final Color? color;

  /// Overall card height. The mascot badge spans it and the pill is inset
  /// vertically so the badge pops above and below.
  final double height;

  /// Whether the card accepts input. Interactivity requires both this and a
  /// non-null [onTap]; either one off renders the card dimmed.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final face = color ?? operation.color;
    final h = height;
    final pillHeight = h * 0.84;
    final pillInset = (h - pillHeight) / 2;
    final textLeftPad = h + h * 0.10; // badge diameter (== h) + gap

    final interactive = enabled && onTap != null;

    // Single accessible node: a labelled button carrying the tap action; the
    // visual subtree's own semantics are excluded to avoid duplicate nodes.
    return Semantics(
      button: interactive,
      enabled: interactive,
      label: '$title, $subtitle',
      onTap: interactive ? onTap : null,
      child: ExcludeSemantics(
        child: GamePressable(
          onTap: onTap,
          enabled: interactive,
          child: SizedBox(
            height: h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Glossy color pill, inset top/bottom so the mascot can pop out.
                Positioned(
                  left: 0,
                  right: 0,
                  top: pillInset,
                  height: pillHeight,
                  child: GameGlossSurface(
                    color: face,
                    borderRadius: BorderRadius.circular(pillHeight / 2),
                    referenceSize: pillHeight,
                    highlightScale: 2.2,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: textLeftPad,
                        right: h * 0.26,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: _OperationText(
                                title: title,
                                subtitle: subtitle,
                                face: face,
                                pillHeight: pillHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Circular white mascot badge, spanning the full card height.
                Positioned(
                  left: h * 0.02,
                  top: 0,
                  width: h,
                  height: h,
                  child: _MascotBadge(mascot: operation.mascot, diameter: h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Stacked title (stroked) + subtitle (muted white), sized from [pillHeight].
class _OperationText extends StatelessWidget {
  const _OperationText({
    required this.title,
    required this.subtitle,
    required this.face,
    required this.pillHeight,
  });

  final String title;
  final String subtitle;
  final Color face;
  final double pillHeight;

  @override
  Widget build(BuildContext context) {
    // The stroke reuses the gloss surface's deep-edge recipe so the headline
    // reads as the same molded plastic across every face color.
    final stroke = GameColors.deepen(face, 0.30, 0.18);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameStrokedText(
          title,
          color: GameColors.textOnPrimary,
          strokeColor: stroke,
          strokeWidth: pillHeight * 0.03,
          fontSize: pillHeight * 0.32,
          fontFamily: GameDesignTokens.fontFamilyDisplay,
          fontWeight: FontWeight.w800,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: pillHeight * 0.04),
        Text(
          subtitle,
          style: TextStyle(
            color: GameColors.textOnPrimary.withValues(alpha: 0.92),
            fontFamily: GameDesignTokens.fontFamily,
            fontSize: pillHeight * 0.20,
            fontWeight: FontWeight.w600,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

/// White circular badge holding the mascot head, with a soft drop shadow so it
/// lifts off the colored pill.
class _MascotBadge extends StatelessWidget {
  const _MascotBadge({required this.mascot, required this.diameter});

  final GameMascot mascot;
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      padding: EdgeInsets.all(diameter * 0.10),
      decoration: BoxDecoration(
        color: GameColors.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: GameColors.shadowStrong,
            blurRadius: diameter * 0.10,
            offset: Offset(0, diameter * 0.04),
          ),
        ],
      ),
      child: ClipOval(
        child: GameMascotImage(
          mascot: mascot,
          pose: GameMascotPose.head,
          size: diameter * 0.8,
        ),
      ),
    );
  }
}
