import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameTabBar] examples.
class GameTabBarPage extends StatefulWidget {
  const GameTabBarPage({super.key});

  @override
  State<GameTabBarPage> createState() => _GameTabBarPageState();
}

class _GameTabBarPageState extends State<GameTabBarPage> {
  int _threeIndex = 0;
  int _fourIndex = 1;
  int _themedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameTabBar'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameTabBar',
              subtitle: 'Rounded pill tab switcher',
              body:
                  'Equal-width tabs inside a rounded pill background. The '
                  'active tab fills with a colored pill; inactive labels stay '
                  'muted. Parent owns the index and reacts via onChanged.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: '3-tab variant',
              description: 'Default primary color, three sections.',
              child: Column(
                children: [
                  GameTabBar(
                    labels: const ['Home', 'Lessons', 'Practice'],
                    currentIndex: _threeIndex,
                    onChanged: (i) => setState(() => _threeIndex = i),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Selected: ${['Home', 'Lessons', 'Practice'][_threeIndex]}',
                    style: DocTheme.caption,
                  ),
                ],
              ),
            ),
            DocSection(
              title: '4-tab variant',
              description: 'More sections — tabs share the row evenly.',
              child: Column(
                children: [
                  GameTabBar(
                    labels: const ['Daily', 'Quests', 'Shop', 'Profile'],
                    currentIndex: _fourIndex,
                    onChanged: (i) => setState(() => _fourIndex = i),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Selected: '
                    '${['Daily', 'Quests', 'Shop', 'Profile'][_fourIndex]}',
                    style: DocTheme.caption,
                  ),
                ],
              ),
            ),
            DocSection(
              title: 'Themed',
              description:
                  'Swap activeColor / inactiveColor / backgroundColor.',
              child: GameTabBar(
                labels: const ['Easy', 'Normal', 'Hard'],
                currentIndex: _themedIndex,
                onChanged: (i) => setState(() => _themedIndex = i),
                activeColor: GameColors.danger,
                inactiveColor: const Color(0xFF8C5A5A),
                backgroundColor: const Color(0xFFF7E1E1),
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameTabBar(\n'
              "  labels: const ['Home', 'Lessons', 'Practice'],\n"
              '  currentIndex: tabIndex,\n'
              '  onChanged: (i) => setState(() => tabIndex = i),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}
