import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pump(WidgetTester tester, Widget child, {ThemeData? theme}) {
    return tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  group('GameStepIndicator', () {
    testWidgets('announces the current step', (tester) async {
      await pump(tester, const GameStepIndicator(count: 4, currentIndex: 1));

      expect(find.bySemanticsLabel('Step 2 of 4'), findsOneWidget);
    });

    testWidgets('appends the optional current-step name', (tester) async {
      await pump(
        tester,
        const GameStepIndicator(
          count: 4,
          currentIndex: 1,
          semanticCurrentStepLabel: 'Payment',
        ),
      );

      expect(find.bySemanticsLabel('Step 2 of 4, Payment'), findsOneWidget);
    });

    testWidgets('announces completion when past the last step', (tester) async {
      await pump(tester, const GameStepIndicator(count: 3, currentIndex: 3));

      expect(find.bySemanticsLabel('All 3 steps completed'), findsOneWidget);
    });

    testWidgets('uses the Turkish preset when registered', (tester) async {
      await pump(
        tester,
        const GameStepIndicator(count: 4, currentIndex: 1),
        theme: ThemeData(extensions: [GameUiStringsTheme.tr()]),
      );

      expect(find.bySemanticsLabel('Adım 2 / 4'), findsOneWidget);
    });
  });

  group('GameProgressBar', () {
    testWidgets('exposes the loading label and percent value', (tester) async {
      await pump(
        tester,
        const SizedBox(width: 200, child: GameProgressBar(value: 0.4)),
      );

      final semantics = tester.getSemantics(find.bySemanticsLabel('Loading'));
      expect(semantics.value, '40%');
    });

    testWidgets('semanticLabel overrides the default', (tester) async {
      await pump(
        tester,
        const SizedBox(
          width: 200,
          child: GameProgressBar(value: 1, semanticLabel: 'XP'),
        ),
      );

      expect(find.bySemanticsLabel('XP'), findsOneWidget);
    });
  });
}
