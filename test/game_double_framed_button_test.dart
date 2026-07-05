import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pumpButton(WidgetTester tester, {Widget? button}) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(child: button ?? const GameDoubleFramedButton()),
        ),
      ),
    );
  }

  group('GameDoubleFramedButton', () {
    testWidgets('renders entirely without an image asset', (tester) async {
      await pumpButton(tester);

      expect(find.byType(Image), findsNothing);
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('text constructor creates fitted content', (tester) async {
      await pumpButton(tester, button: GameDoubleFramedButton.text('Play'));

      expect(find.text('Play'), findsOneWidget);
      expect(find.byType(FittedBox), findsOneWidget);
    });

    testWidgets('icon constructor forwards custom colors', (tester) async {
      await pumpButton(
        tester,
        button: GameDoubleFramedButton.icon(
          Icons.star_rounded,
          backgroundColor: Colors.purple,
          outerBorderColor: Colors.indigo,
        ),
      );

      final button = tester.widget<GameDoubleFramedButton>(
        find.byType(GameDoubleFramedButton),
      );
      expect(button.backgroundColor, Colors.purple);
      expect(button.outerBorderColor, Colors.indigo);
      expect(find.byIcon(Icons.star_rounded), findsOneWidget);
    });

    testWidgets('reports taps when enabled', (tester) async {
      var taps = 0;
      await pumpButton(
        tester,
        button: GameDoubleFramedButton(onTap: () => taps++),
      );

      await tester.tap(find.byType(GameDoubleFramedButton));

      expect(taps, 1);
    });

    testWidgets('ignores taps when disabled', (tester) async {
      var taps = 0;
      await pumpButton(
        tester,
        button: GameDoubleFramedButton(enabled: false, onTap: () => taps++),
      );

      await tester.tap(
        find.byType(GameDoubleFramedButton),
        warnIfMissed: false,
      );

      expect(taps, 0);
    });
  });
}
