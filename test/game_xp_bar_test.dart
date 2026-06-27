import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameXpBar', () {
    // The fill is reveal-clipped to `progress` (not stretched), so the clip
    // region width must scale linearly with progress. Guards against the
    // tight-constraint regression where the fill always showed in full.
    Future<double> clipWidth(WidgetTester tester, double progress) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GameXpBar(progress: progress, width: 200, height: 32),
            ),
          ),
        ),
      );
      return tester.getSize(find.byType(ClipRect)).width;
    }

    testWidgets('reveals nothing at 0', (tester) async {
      expect(await clipWidth(tester, 0), 0);
    });

    testWidgets('reveals half at 0.5', (tester) async {
      expect(await clipWidth(tester, 0.5), 100);
    });

    testWidgets('reveals full at 1', (tester) async {
      expect(await clipWidth(tester, 1), 200);
    });

    testWidgets('clamps progress above 1', (tester) async {
      expect(await clipWidth(tester, 1.5), 200);
    });
  });
}
