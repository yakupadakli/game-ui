import 'package:flutter/material.dart';

import 'game_button.dart';
import 'game_button_variant.dart';

/// Small square back button — convenience wrapper around
/// [GameButton.square] with a chevron-left icon child.
class GameReturnButton extends StatelessWidget {
  const GameReturnButton({
    this.onTap,
    this.size = 48,
    this.enabled = true,
    super.key,
  });

  final VoidCallback? onTap;
  final double size;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GameButton(
      variant: GameButtonVariant.square,
      size: size,
      onTap: onTap,
      enabled: enabled,
      child: Icon(Icons.chevron_left, color: Colors.white, size: size * 0.6),
    );
  }
}
