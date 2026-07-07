import 'package:flutter/widgets.dart';

import '../animations/game_tap_scale.dart';
import 'game_disabled_overlay.dart';

/// The shared press behavior behind every game_ui button: a
/// [GameDisabledOverlay] wrapping a [GameTapScale], with the standard
/// "only depress when there's a live handler" guard applied once.
///
/// [child] is the fully-drawn button face. When [enabled] is false the child is
/// dimmed and pointer events are blocked; when it is enabled but has no [onTap]
/// or [onLongPress] the press-scale is suppressed so a handler-less button does
/// not visually depress.
///
/// Also exposes a single `button` node to assistive technology: descendant
/// labels (the child's [Text] / [Icon] semantics) fold into it, or pass
/// [semanticLabel] to name it explicitly. The node reports `enabled` only when
/// there's a live handler, and carries the tap action for screen-reader
/// activation.
///
/// Use this instead of hand-wiring `GameDisabledOverlay(child: GameTapScale(…))`
/// so the disabled look, press feel, and button semantics stay identical across
/// the library.
class GamePressable extends StatelessWidget {
  const GamePressable({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.enabled = true,
    this.scaleDown = 0.95,
    this.enableFeedback = true,
    this.semanticLabel,
    super.key,
  });

  /// The button face to make pressable.
  final Widget child;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enabled;

  /// Press-down target scale, forwarded to [GameTapScale] (default 0.95).
  final double scaleDown;

  /// When true, plays platform feedback (haptic / click) on activation.
  final bool enableFeedback;

  /// Explicit button label for assistive tech. When null, the label is merged
  /// from the child's own semantics (its [Text] / [Icon]).
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final interactive = enabled && (onTap != null || onLongPress != null);
    final pressable = GameDisabledOverlay(
      disabled: !enabled,
      child: GameTapScale(
        enabled: interactive,
        scaleDown: scaleDown,
        enableFeedback: enableFeedback,
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );

    return MergeSemantics(
      child: Semantics(
        button: true,
        enabled: interactive,
        label: semanticLabel,
        onTap: interactive ? onTap : null,
        child: pressable,
      ),
    );
  }
}
