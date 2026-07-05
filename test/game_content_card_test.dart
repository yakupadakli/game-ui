import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameContentCard', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(child: GameContentCard(child: Text('7 + 5 = ?'))),
          ),
        ),
      );

      expect(find.text('7 + 5 = ?'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders the optional bottom and mascot slots', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: GameContentCard(
                mascot: Text('mascot'),
                bottom: Text('bottom'),
                child: Text('body'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('body'), findsOneWidget);
      expect(find.text('bottom'), findsOneWidget);
      expect(find.text('mascot'), findsOneWidget);
    });
  });
}
