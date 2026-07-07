import 'package:flutter/material.dart';

import '../../core/game_button_size.dart';
import 'game_button.dart';
import 'game_button_variant.dart';

/// Small square back button — convenience wrapper around a [GameButton] with
/// [GameButtonVariant.square] and a chevron-left icon child. Defaults to the
/// compact [GameButtonSize.extraSmall]; pass any [GameButtonSize] or raw number.
class GameReturnButton extends StatelessWidget {
  const GameReturnButton({
    this.onTap,
    this.size = GameButtonSize.extraSmall,
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
