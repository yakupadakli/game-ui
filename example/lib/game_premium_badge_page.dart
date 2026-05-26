import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GamePremiumBadge] examples.
class GamePremiumBadgePage extends StatelessWidget {
  const GamePremiumBadgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GamePremiumBadge'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GamePremiumBadge',
              subtitle: 'Tiny gradient pill for PRO / premium markers',
              body:
                  'Drop this next to a feature, character, or list row to '
                  'mark it as premium content. Gradient body, glow shadow, '
                  'and uppercase letter-spaced label keep it loud and clear.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Default — PRO',
              description: 'Gold gradient with diamond icon.',
              child: Center(child: GamePremiumBadge()),
            ),
            DocSection(
              title: 'Themed variants',
              description:
                  'Override color / darkColor / icon / label for tiers.',
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  GamePremiumBadge(),
                  GamePremiumBadge(
                    label: 'VIP',
                    icon: Icons.star_rounded,
                    color: Color(0xFFE040FB),
                    darkColor: Color(0xFF8E24AA),
                  ),
                  GamePremiumBadge(
                    label: 'NEW',
                    icon: Icons.bolt_rounded,
                    color: Color(0xFF34C759),
                    darkColor: Color(0xFF1B6E2A),
                  ),
                  GamePremiumBadge(
                    label: 'HOT',
                    icon: Icons.local_fire_department_rounded,
                    color: Color(0xFFFF6B6B),
                    darkColor: Color(0xFFB23A3A),
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'Inline with a label',
              description: 'Pairs nicely beside row titles or character names.',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Shadow Dragon',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(width: 8),
                  GamePremiumBadge(),
                ],
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GamePremiumBadge()',
            ),
          ],
        ),
      ),
    );
  }
}
