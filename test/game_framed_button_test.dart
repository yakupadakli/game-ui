import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pumpButton(
    WidgetTester tester, {
    VoidCallback? onTap,
    bool enabled = true,
  }) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: GameFramedButton(
              onTap: onTap,
              enabled: enabled,
              child: const Text('Play'),
            ),
          ),
        ),
      ),
    );
  }

  group('GameFramedButton', () {
    testWidgets('renders without an image asset', (tester) async {
      await pumpButton(tester);

      expect(find.byType(Image), findsNothing);
      expect(find.text('Play'), findsOneWidget);
      expect(find.byType(FittedBox), findsOneWidget);
      expect(
        tester.widget<FittedBox>(find.byType(FittedBox)).fit,
        BoxFit.scaleDown,
      );
    });

    testWidgets('text constructor creates a fitted label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(child: GameFramedButton.text('Start game')),
          ),
        ),
      );

      expect(find.text('Start game'), findsOneWidget);
      expect(find.byType(FittedBox), findsOneWidget);
      expect(tester.widget<Text>(find.text('Start game')).maxLines, 1);
    });

    testWidgets('icon constructor creates a fitted icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GameFramedButton.icon(
                Icons.star_rounded,
                semanticLabel: 'Favorite',
              ),
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.star_rounded));
      expect(icon.color, Colors.white);
      expect(icon.semanticLabel, 'Favorite');
      expect(find.byType(FittedBox), findsOneWidget);
    });

    testWidgets('reports taps when enabled', (tester) async {
      var taps = 0;
      await pumpButton(tester, onTap: () => taps++);

      await tester.tap(find.byType(GameFramedButton));

      expect(taps, 1);
    });

    testWidgets('ignores taps when disabled', (tester) async {
      var taps = 0;
      await pumpButton(tester, onTap: () => taps++, enabled: false);

      await tester.tap(find.byType(GameFramedButton), warnIfMissed: false);

      expect(taps, 0);
    });
  });
}
