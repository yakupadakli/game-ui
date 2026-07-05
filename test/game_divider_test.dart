import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pump(WidgetTester tester, Widget child) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  group('GameDivider', () {
    testWidgets('renders a plain line without a center', (tester) async {
      await pump(tester, const GameDivider());

      expect(find.byType(GameDivider), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders the center widget when provided', (tester) async {
      await pump(tester, const GameDivider(center: Text('OR')));

      expect(find.text('OR'), findsOneWidget);
    });
  });
}
