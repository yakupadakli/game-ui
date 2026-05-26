import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameSocialButton] examples.
class GameSocialButtonPage extends StatelessWidget {
  const GameSocialButtonPage({super.key});

  void _noop() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameSocialButton'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameSocialButton',
              subtitle: 'Provider-branded sign-in buttons',
              body:
                  'Render Google, Apple, Facebook, and X sign-in buttons with '
                  'each provider\'s palette and leading icon. Pass a custom '
                  'label to override the default copy per locale.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'All providers',
              description:
                  'Stack of every supported provider with default labels.',
              child: Column(
                children: [
                  GameSocialButton(
                    provider: GameSocialProvider.google,
                    onTap: _noop,
                  ),
                  const SizedBox(height: 12),
                  GameSocialButton(
                    provider: GameSocialProvider.apple,
                    onTap: _noop,
                  ),
                  const SizedBox(height: 12),
                  GameSocialButton(
                    provider: GameSocialProvider.facebook,
                    onTap: _noop,
                  ),
                  const SizedBox(height: 12),
                  GameSocialButton(
                    provider: GameSocialProvider.x,
                    onTap: _noop,
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'Custom label',
              description: 'Override the per-provider default copy.',
              child: GameSocialButton(
                provider: GameSocialProvider.google,
                label: 'Sign in with your Google account',
                onTap: _noop,
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameSocialButton(\n'
              '  provider: GameSocialProvider.google,\n'
              '  onTap: () => signInWithGoogle(),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
