import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pumpChip(
    WidgetTester tester, {
    required bool selected,
    required VoidCallback onTap,
    Widget? leading,
  }) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: GameChip(
              label: 'Filter',
              selected: selected,
              onTap: onTap,
              leading: leading,
            ),
          ),
        ),
      ),
    );
  }

  group('GameChip', () {
    testWidgets('renders its label', (tester) async {
      await pumpChip(tester, selected: false, onTap: () {});

      expect(find.text('Filter'), findsOneWidget);
    });

    testWidgets('reports taps', (tester) async {
      var taps = 0;
      await pumpChip(tester, selected: false, onTap: () => taps++);

      await tester.tap(find.byType(GameChip));
      expect(taps, 1);
    });

    testWidgets('renders the leading widget when provided', (tester) async {
      await pumpChip(
        tester,
        selected: true,
        onTap: () {},
        leading: const Icon(Icons.star),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });
  });
}
