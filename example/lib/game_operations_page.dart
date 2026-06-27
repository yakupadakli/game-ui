import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameOperationLabel] examples.
class GameOperationsPage extends StatelessWidget {
  const GameOperationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Operation labels'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameOperationLabel',
              subtitle: 'Themed operation signs (4)',
              body:
                  'Bundled themed signs for the four operations, reusing the '
                  'shared GameOperation enum so they stay in sync with '
                  'GameOperationCard. Use as a level / section header.',
            ),
            const SizedBox(height: 24),
            const DocSection(
              title: 'All operations',
              description:
                  'GameOperation.values — addition, subtraction, '
                  'multiplication, division.',
              child: _OperationGrid(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameOperationLabel(\n'
              '  operation: GameOperation.multiplication,\n'
              '  height: 80,\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _OperationGrid extends StatelessWidget {
  const _OperationGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: GameOperation.values
          .map(
            (o) => SizedBox(
              width: 120,
              child: Column(
                children: [
                  GameOperationLabel(operation: o, height: 96),
                  const SizedBox(height: 4),
                  Text(o.name, style: DocTheme.caption),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
