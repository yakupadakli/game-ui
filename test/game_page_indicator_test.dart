import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pumpIndicator(
    WidgetTester tester, {
    required int count,
    required int currentIndex,
  }) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: GamePageIndicator(count: count, currentIndex: currentIndex),
          ),
        ),
      ),
    );
  }

  group('GamePageIndicator', () {
    testWidgets('renders one dot per page', (tester) async {
      await pumpIndicator(tester, count: 4, currentIndex: 0);

      expect(find.byType(AnimatedContainer), findsNWidgets(4));
    });

    testWidgets('the active dot is wider than the inactive dots', (
      tester,
    ) async {
      await pumpIndicator(tester, count: 3, currentIndex: 1);

      final widths = tester
          .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
          .map((c) => tester.getSize(find.byWidget(c)).width)
          .toList();

      // Exactly one dot (the active one) is wider than the others.
      final maxWidth = widths.reduce((a, b) => a > b ? a : b);
      expect(widths.where((w) => w == maxWidth).length, 1);
    });
  });
}
