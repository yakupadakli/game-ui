import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameButton', () {
    testWidgets('renders and taps for every variant (code-rendered)', (
      tester,
    ) async {
      for (final variant in GameButtonVariant.values) {
        var taps = 0;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: GameButton(
                  variant: variant,
                  onTap: () => taps++,
                  child: const Text('1'),
                ),
              ),
            ),
          ),
        );

        expect(tester.takeException(), isNull);
        await tester.tap(find.byType(GameButton));
        await tester.pumpAndSettle();
        expect(taps, 1, reason: 'variant $variant should fire onTap');
      }
    });

    testWidgets('tint recolors without loading any image', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GameButton(tint: Color(0xFFFF0000), child: Text('1')),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      expect(find.byType(Image), findsNothing);
    });
  });

  group('GameImageButton', () {
    testWidgets('renders every style with no image assets', (tester) async {
      for (final style in GameImageButtonStyle.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: GameImageButton(style: style, width: 140, onTap: () {}),
              ),
            ),
          ),
        );

        expect(
          tester.takeException(),
          isNull,
          reason: 'style $style should render',
        );
      }
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('exposes semanticLabel', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GameImageButton(
              style: GameImageButtonStyle.blue,
              semanticLabel: 'Start',
            ),
          ),
        ),
      );

      expect(find.bySemanticsLabel('Start'), findsOneWidget);
      handle.dispose();
    });
  });
}
