import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pumpTabBar(
    WidgetTester tester, {
    required int currentIndex,
    required ValueChanged<int> onChanged,
  }) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: GameTabBar(
              labels: const ['Home', 'Shop', 'Profile'],
              currentIndex: currentIndex,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }

  group('GameTabBar', () {
    testWidgets('renders every label', (tester) async {
      await pumpTabBar(tester, currentIndex: 0, onChanged: (_) {});

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('reports the tapped tab index', (tester) async {
      int? tapped;
      await pumpTabBar(tester, currentIndex: 0, onChanged: (i) => tapped = i);

      await tester.tap(find.text('Profile'));
      expect(tapped, 2);
    });
  });
}
