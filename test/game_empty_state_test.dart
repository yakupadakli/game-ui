import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameEmptyState', () {
    testWidgets('renders only the title when nothing else is supplied', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GameEmptyState(title: 'No items yet')),
        ),
      );

      expect(find.text('No items yet'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders illustration, message, and action when provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GameEmptyState(
              title: 'Inventory empty',
              illustration: const Icon(Icons.inbox),
              message: 'Collect items to see them here.',
              action: TextButton(onPressed: () {}, child: const Text('Shop')),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.inbox), findsOneWidget);
      expect(find.text('Collect items to see them here.'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
    });
  });
}
