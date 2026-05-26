import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameBanner] examples.
class GameBannerPage extends StatefulWidget {
  const GameBannerPage({super.key});

  @override
  State<GameBannerPage> createState() => _GameBannerPageState();
}

class _GameBannerPageState extends State<GameBannerPage> {
  bool _showDismissable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameBanner'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameBanner',
              subtitle: 'Inline persistent notice',
              body:
                  'A bordered banner you mount inline above content. Use it '
                  'for warnings, info notices, or any persistent message '
                  'with an optional action button and dismiss control.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Dismissable warning',
              description:
                  'Tap the close icon to remove the banner. Tap "Reset" '
                  'below to bring it back.',
              child: Column(
                children: [
                  if (_showDismissable)
                    GameBanner(
                      message:
                          'Your trial expires in 3 days. Upgrade to keep '
                          'your progress.',
                      icon: Icons.warning_amber_rounded,
                      onDismiss: () => setState(() => _showDismissable = false),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: TextButton(
                          onPressed: () =>
                              setState(() => _showDismissable = true),
                          child: const Text('Reset banner'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            DocSection(
              title: 'Info — no controls',
              description: 'Pure informational banner. No action, no dismiss.',
              child: GameBanner(
                message: 'Daily quests refresh in 4 hours.',
                icon: Icons.info_outline,
                color: GameColors.primary,
              ),
            ),
            DocSection(
              title: 'Success + action',
              description:
                  'Action label is uppercased automatically. Use it for '
                  'follow-up calls to action like "View" or "Retry".',
              child: GameBanner(
                message: 'Achievement unlocked: 10-day streak!',
                icon: Icons.emoji_events_rounded,
                color: GameColors.success,
                actionLabel: 'View',
                onActionTap: () {},
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameBanner(\n'
              "  message: 'Achievement unlocked!',\n"
              '  icon: Icons.emoji_events_rounded,\n'
              '  color: GameColors.success,\n'
              "  actionLabel: 'View',\n"
              '  onActionTap: () {},\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
