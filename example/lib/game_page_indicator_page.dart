import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GamePageIndicator] examples.
class GamePageIndicatorPage extends StatefulWidget {
  const GamePageIndicatorPage({super.key});

  @override
  State<GamePageIndicatorPage> createState() => _GamePageIndicatorPageState();
}

class _GamePageIndicatorPageState extends State<GamePageIndicatorPage> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GamePageIndicator'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GamePageIndicator',
              subtitle: 'Animated dots that pill on active',
              body:
                  'Pair with a PageView for onboarding or level intro '
                  'carousels — the active index morphs into a wider rounded '
                  'pill, inactive indices stay as dots.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Live demo — swipe the carousel',
              description: 'PageView + GamePageIndicator wired together.',
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: 4,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (context, i) {
                        final colors = [
                          GameColors.primary,
                          GameColors.warning,
                          GameColors.success,
                          GameColors.accent,
                        ];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: colors[i].withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: colors[i], width: 2),
                          ),
                          child: Center(
                            child: Text(
                              'Page ${i + 1}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: colors[i],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: GamePageIndicator(count: 4, currentIndex: _index),
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'Themed',
              description:
                  'Tweak activeColor / inactiveColor / dot size / activeWidth.',
              child: Center(
                child: GamePageIndicator(
                  count: 5,
                  currentIndex: 2,
                  activeColor: GameColors.danger,
                  inactiveColor: Color(0xFFF0D5D5),
                  dotSize: 14,
                  activeWidth: 40,
                  spacing: 10,
                ),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GamePageIndicator(\n'
              '  count: 4,\n'
              '  currentIndex: pageIndex,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
