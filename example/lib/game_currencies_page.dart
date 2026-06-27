import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameCoinImage] examples.
class GameCurrenciesPage extends StatelessWidget {
  const GameCurrenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Currencies'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameCoinImage',
              subtitle: 'Coin / currency tokens (3 illustrations)',
              body:
                  'Reward tokens for scores and shops — a star coin, a gold '
                  'stack, and a double star-coin. Pass onTap for a tappable '
                  'currency chip.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All coins',
              description: 'GameCoin.values — 3 bundled tokens.',
              child: _CoinGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameCoinImage(\n'
              '  coin: GameCoin.stackGold,\n'
              '  size: 96,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _CoinGrid extends StatelessWidget {
  const _CoinGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: GameCoin.values
          .map(
            (c) => Column(
              children: [
                GameCoinImage(coin: c, size: 90),
                const SizedBox(height: 4),
                Text(c.name, style: DocTheme.caption),
              ],
            ),
          )
          .toList(),
    );
  }
}
