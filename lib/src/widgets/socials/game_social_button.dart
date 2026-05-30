import 'package:flutter/material.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_design_tokens.dart';

/// Supported third-party identity providers for [GameSocialButton].
enum GameSocialProvider { google, apple, facebook, x }

/// Named default height for [GameSocialButton] (logical pixels). [height]
/// also accepts any raw number; this is the recommended default.
abstract final class GameSocialButtonSize {
  GameSocialButtonSize._();

  static const double height = 56;
}

/// Full-width sign-in button branded for a specific [GameSocialProvider].
///
/// Pass a [label] to override the per-provider default copy. Each provider
/// has its own background, foreground, and leading icon.
class GameSocialButton extends StatelessWidget {
  const GameSocialButton({
    required this.provider,
    required this.onTap,
    this.label,
    this.height = GameSocialButtonSize.height,
    super.key,
  });

  final GameSocialProvider provider;
  final VoidCallback onTap;
  final String? label;
  final double height;

  _SocialStyle get _style => switch (provider) {
    GameSocialProvider.google => const _SocialStyle(
      background: Colors.white,
      foreground: Color(0xFF1A1A1A),
      iconColor: Color(0xFFEA4335),
      borderColor: Color(0xFF1A1A1A),
      icon: Icons.account_circle,
      defaultLabel: 'Continue with Google',
    ),
    GameSocialProvider.apple => const _SocialStyle(
      background: Colors.black,
      foreground: Colors.white,
      iconColor: Colors.white,
      icon: Icons.apple,
      defaultLabel: 'Continue with Apple',
    ),
    GameSocialProvider.facebook => const _SocialStyle(
      background: Color(0xFF1877F2),
      foreground: Colors.white,
      iconColor: Colors.white,
      icon: Icons.facebook,
      defaultLabel: 'Continue with Facebook',
    ),
    GameSocialProvider.x => const _SocialStyle(
      background: Colors.black,
      foreground: Colors.white,
      iconColor: Colors.white,
      icon: Icons.close,
      defaultLabel: 'Continue with X',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final style = _style;
    final resolvedLabel = label ?? style.defaultLabel;

    return GameTapScale(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: style.background,
          borderRadius: BorderRadius.circular(GameDesignTokens.radiusMD),
          border: style.borderColor == null
              ? null
              : Border.all(color: style.borderColor!, width: 1),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(style.icon, size: 24, color: style.iconColor),
            const SizedBox(width: GameDesignTokens.spacingMD),
            Expanded(
              child: Text(
                resolvedLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: style.foreground,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class _SocialStyle {
  const _SocialStyle({
    required this.background,
    required this.foreground,
    required this.iconColor,
    required this.icon,
    required this.defaultLabel,
    this.borderColor,
  });

  final Color background;
  final Color foreground;
  final Color iconColor;
  final IconData icon;
  final String defaultLabel;
  final Color? borderColor;
}
