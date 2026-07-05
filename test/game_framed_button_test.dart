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

    testWidgets('renders a visible dark outer outline', (tester) async {
      await pumpButton(tester);

      final outerDecoration = tester
          .widgetList<DecoratedBox>(find.byType(DecoratedBox))
          .map((widget) => widget.decoration)
          .whereType<BoxDecoration>()
          .firstWhere(
            (decoration) =>
                decoration.color == Colors.white && decoration.border != null,
          );
      final border = outerDecoration.border! as Border;

      expect(border.top.width, greaterThan(0));
      expect(border.top.color.a, greaterThan(0));
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

    testWidgets('text constructor forwards the background color', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GameFramedButton.text(
                'Start game',
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
      );

      expect(
        tester
            .widget<GameFramedButton>(find.byType(GameFramedButton))
            .backgroundColor,
        Colors.red,
      );
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

  group('GameFramedWideButton', () {
    testWidgets('uses the default rectangular dimensions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(child: GameFramedWideButton.text('Continue')),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(GameFramedWideButton)),
        const Size(220, 64),
      );
      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(FittedBox), findsOneWidget);
    });

    testWidgets('large preset uses the expected dimensions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GameFramedWideButton.icon(
                Icons.play_arrow_rounded,
                size: GameFramedWideButtonSize.large,
                backgroundColor: Colors.purple,
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(GameFramedWideButton)),
        const Size(280, 72),
      );
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
      expect(
        tester
            .widget<GameFramedWideButton>(find.byType(GameFramedWideButton))
            .backgroundColor,
        Colors.purple,
      );
    });

    testWidgets('full preset fills the available width', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 360,
                child: GameFramedWideButton.text(
                  'Full width',
                  size: GameFramedWideButtonSize.full,
                ),
              ),
            ),
          ),
        ),
      );

      expect(
        tester.getSize(find.byType(GameFramedWideButton)),
        const Size(360, 72),
      );
    });
  });
}
