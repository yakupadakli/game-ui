import 'package:flutter/widgets.dart';

import 'game_design_tokens.dart';

/// Dims [child] to [GameDesignTokens.disabledOpacity] and blocks pointer
/// events when [disabled] is `true`; otherwise returns [child] untouched.
///
/// Used by game_ui controls to render a consistent dimmed, non-interactive
/// look for `enabled: false` states without rebuilding the underlying asset.
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
    return Opacity(
      opacity: GameDesignTokens.disabledOpacity,
      child: IgnorePointer(child: child),
    );
  }
}
