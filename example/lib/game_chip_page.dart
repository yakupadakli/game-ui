import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameChip] examples.
class GameChipPage extends StatefulWidget {
  const GameChipPage({super.key});

  @override
  State<GameChipPage> createState() => _GameChipPageState();
}

class _GameChipPageState extends State<GameChipPage> {
  static const _filters = ['All', 'Action', 'Puzzle', 'Racing'];
  String _selected = 'All';
  final Set<String> _tags = {'Easy'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameChip'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameChip',
              subtitle: 'Pill-shaped toggle chip',
              body:
                  'Pill-shaped chips for filter bars and tag selectors. When '
                  'selected they fill with the accent color; when not, they '
                  'sit as a soft tinted outline of the same color.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Single-select filter bar',
              description: 'Pick one of several mutually exclusive options.',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final filter in _filters)
                    GameChip(
                      label: filter,
                      selected: _selected == filter,
                      onTap: () => setState(() => _selected = filter),
                    ),
                ],
              ),
            ),
            DocSection(
              title: 'Multi-select with leading icons',
              description: 'Each chip can carry an icon and its own color.',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _tagChip('Easy', Icons.bolt_rounded, GameColors.success),
                  _tagChip(
                    'Medium',
                    Icons.local_fire_department_rounded,
                    GameColors.warning,
                  ),
                  _tagChip('Hard', Icons.whatshot_rounded, GameColors.danger),
                  _tagChip('Boss', Icons.shield_rounded, GameColors.accent),
                ],
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameChip(\n'
              "  label: 'Action',\n"
              '  selected: selected,\n'
              '  onTap: () => setState(() => selected = !selected),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }

  Widget _tagChip(String label, IconData icon, Color color) {
    return GameChip(
      label: label,
      selected: _tags.contains(label),
      color: color,
      leading: Icon(icon),
      onTap: () => setState(() {
        if (!_tags.add(label)) _tags.remove(label);
      }),
    );
  }
}
