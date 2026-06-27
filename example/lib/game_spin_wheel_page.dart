import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameSpinWheel] examples.
class GameSpinWheelPage extends StatefulWidget {
  const GameSpinWheelPage({super.key});

  @override
  State<GameSpinWheelPage> createState() => _GameSpinWheelPageState();
}

class _GameSpinWheelPageState extends State<GameSpinWheelPage> {
  static const int _segments = 8;
  final GameSpinWheelController _controller = GameSpinWheelController();
  final Random _random = Random();
  int? _result;
  bool _spinning = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spin() {
    if (_spinning) return;
    setState(() {
      _spinning = true;
      _result = null;
    });
    _controller.spinTo(_random.nextInt(_segments));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameSpinWheel'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameSpinWheel',
              subtitle: 'Spinnable reward wheel',
              body:
                  'Divide the bundled wheel art into equal segments, then '
                  'drive it with a GameSpinWheelController — spinTo(index) '
                  'animates it under the top pointer and reports the landed '
                  'index via onSpinEnd.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Spin it',
              description: '$_segments segments; lands on a random index.',
              child: Column(
                children: [
                  GameSpinWheel(
                    controller: _controller,
                    segments: _segments,
                    onSpinEnd: (index) => setState(() {
                      _spinning = false;
                      _result = index;
                    }),
                    pointer: const Icon(
                      Icons.arrow_drop_down,
                      size: 48,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: _spinning ? null : _spin,
                    child: Text(_spinning ? 'Spinning…' : 'SPIN'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _result == null ? 'Tap SPIN' : 'Landed on segment $_result',
                    style: DocTheme.body,
                  ),
                ],
              ),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'final controller = GameSpinWheelController();\n'
              '\n'
              'GameSpinWheel(\n'
              '  controller: controller,\n'
              '  segments: 8,\n'
              '  onSpinEnd: (index) => print(index),\n'
              ');\n'
              '// later: controller.spinTo(3);',
            ),
          ],
        ),
      ),
    );
  }
}
