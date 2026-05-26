import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTooltip] examples.
class GameTooltipPage extends StatelessWidget {
  const GameTooltipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameTooltip'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DocIntro(
              title: 'GameTooltip',
              subtitle: 'Game-styled tooltip bubble',
              body:
                  'A drop-in replacement for Material.Tooltip with a white '
                  'rounded bubble, soft border and drop shadow. Long-press '
                  'the child on mobile, hover on desktop.',
            ),
            SizedBox(height: 24),
            DocSection(
              title: 'Default — long-press the icon',
              description:
                  'Wrap any widget. On mobile the tooltip surfaces after a '
                  'long press; on desktop it appears on hover.',
              child: Center(
                child: GameTooltip(
                  message: 'Daily reward!',
                  child: Icon(
                    Icons.card_giftcard_rounded,
                    size: 48,
                    color: GameColors.primary,
                  ),
                ),
              ),
            ),
            DocSection(
              title: 'Themed — colored bubble',
              description: 'Tweak color / borderColor / textColor.',
              child: Center(
                child: GameTooltip(
                  message: 'Boss fight ahead',
                  color: Color(0xFFFFF4E5),
                  borderColor: GameColors.warning,
                  textColor: Color(0xFF6B4E00),
                  child: Icon(
                    Icons.shield_rounded,
                    size: 48,
                    color: GameColors.warning,
                  ),
                ),
              ),
            ),
            DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameTooltip(\n'
              "  message: 'Daily reward!',\n"
              '  child: Icon(Icons.card_giftcard_rounded),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
