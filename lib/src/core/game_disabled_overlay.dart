import 'package:flutter/widgets.dart';

/// Opacity used to dim a control when it is disabled (Material guideline:
/// 0.38 for disabled foreground content).
const double kGameDisabledOpacity = 0.38;

/// Wraps [child] in an [Opacity] of [kGameDisabledOpacity] when [disabled]
/// is `true`; otherwise returns [child] untouched.
///
/// Used by game_ui controls to render a consistent dimmed look for
/// `enabled: false` states without rebuilding the underlying asset.
class GameDisabledOverlay extends StatelessWidget {
  const GameDisabledOverlay({
    super.key,
    required this.disabled,
    required this.child,
  });

  final bool disabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!disabled) return child;
    return Opacity(opacity: kGameDisabledOpacity, child: child);
  }
}
