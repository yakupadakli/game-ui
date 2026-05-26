import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameSnackBar] examples.
class GameSnackBarPage extends StatelessWidget {
  const GameSnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameSnackBar'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameSnackBar',
              subtitle: 'Toast with the chunky game border',
              body:
                  'Floating toast bar tinted to one of four semantic types: '
                  'info, success, warning, error. Each type ships a default '
                  'icon you can override. Use the showGameSnackBar helper '
                  'to dispatch via ScaffoldMessenger.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Trigger each variant',
              description:
                  'Tap a button to dispatch the matching snack bar. '
                  'They animate in from the bottom.',
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _TriggerButton(
                    label: 'Info',
                    color: GameColors.primary,
                    onTap: () => showGameSnackBar(
                      context,
                      message: 'Saved your progress to the cloud.',
                    ),
                  ),
                  _TriggerButton(
                    label: 'Success',
                    color: GameColors.success,
                    onTap: () => showGameSnackBar(
                      context,
                      message: 'Level 12 unlocked!',
                      type: GameSnackBarType.success,
                    ),
                  ),
                  _TriggerButton(
                    label: 'Warning',
                    color: GameColors.warning,
                    onTap: () => showGameSnackBar(
                      context,
                      message: 'Low energy — recharge soon.',
                      type: GameSnackBarType.warning,
                    ),
                  ),
                  _TriggerButton(
                    label: 'Error',
                    color: GameColors.danger,
                    onTap: () => showGameSnackBar(
                      context,
                      message: 'Network lost. Retrying...',
                      type: GameSnackBarType.error,
                    ),
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'Custom icon',
              description:
                  'Override the default icon with any IconData while '
                  'keeping the type tint.',
              child: Center(
                child: _TriggerButton(
                  label: 'Star toast',
                  color: GameColors.accent,
                  onTap: () => showGameSnackBar(
                    context,
                    message: 'New high score!',
                    type: GameSnackBarType.success,
                    icon: Icons.star_rounded,
                  ),
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'showGameSnackBar(\n'
              '  context,\n'
              "  message: 'Level 12 unlocked!',\n"
              '  type: GameSnackBarType.success,\n'
              ');',
            ),
          ],
        ),
      ),
    );
  }
}

class _TriggerButton extends StatelessWidget {
  const _TriggerButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      ),
    );
  }
}
