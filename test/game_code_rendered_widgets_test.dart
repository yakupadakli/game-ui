import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

/// Smoke tests for the widgets converted from PNG assets to pure code:
/// every variant must render without loading any image.
void main() {
  Future<void> pump(WidgetTester tester, Widget child) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  group('GameFrame', () {
    testWidgets('renders every variant with no image', (tester) async {
      for (final variant in GameFrameVariant.values) {
        await pump(
          tester,
          GameFrame(
            variant: variant,
            width: 160,
            height: 160,
            child: const Text('A'),
          ),
        );
        expect(tester.takeException(), isNull);
      }
      expect(find.byType(Image), findsNothing);
    });
  });

  group('GamePanel', () {
    testWidgets('code variants render with no image', (tester) async {
      for (final variant in const [
        GamePanelVariant.cardBlue,
        GamePanelVariant.answerBox,
      ]) {
        await pump(
          tester,
          GamePanel(
            variant: variant,
            width: 220,
            height: 120,
            child: const Text('A'),
          ),
        );
        expect(tester.takeException(), isNull);
        expect(find.byType(Image), findsNothing);
      }
    });
  });

  group('GameSpeechBubble', () {
    testWidgets('renders with no image', (tester) async {
      await pump(
        tester,
        const GameSpeechBubble(width: 160, height: 160, child: Text('Hi')),
      );
      expect(tester.takeException(), isNull);
      expect(find.byType(Image), findsNothing);
    });
  });

  group('GameCloudLabel', () {
    testWidgets('renders both variants and taps', (tester) async {
      for (final variant in GameCloudLabelVariant.values) {
        var taps = 0;
        await pump(
          tester,
          GameCloudLabel(
            variant: variant,
            width: 220,
            height: 80,
            onTap: () => taps++,
            child: const Text('Label'),
          ),
        );
        expect(tester.takeException(), isNull);
        await tester.tap(find.byType(GameCloudLabel));
        await tester.pumpAndSettle();
        expect(taps, 1);
      }
      expect(find.byType(Image), findsNothing);
    });
  });

  group('GameXpBar', () {
    testWidgets('renders every style with no image', (tester) async {
      for (final style in GameXpBarStyle.values) {
        await pump(
          tester,
          GameXpBar(progress: 0.6, style: style, width: 240, height: 36),
        );
        expect(tester.takeException(), isNull);
      }
      expect(find.byType(Image), findsNothing);
    });
  });

  group('GameIconButton', () {
    testWidgets('renders every variant and taps with no image', (tester) async {
      for (final variant in GameIconButtonVariant.values) {
        var taps = 0;
        await pump(
          tester,
          GameIconButton(variant: variant, onTap: () => taps++),
        );
        expect(tester.takeException(), isNull, reason: '$variant');
        await tester.tap(find.byType(GameIconButton));
        await tester.pumpAndSettle();
        expect(taps, 1, reason: '$variant');
      }
      expect(find.byType(Image), findsNothing);
    });
  });

  group('GameSpinWheel', () {
    testWidgets('renders with custom segment colors and no image', (
      tester,
    ) async {
      await pump(
        tester,
        GameSpinWheel(
          controller: GameSpinWheelController(),
          segments: 8,
          segmentColors: const [Colors.red, Colors.blue],
        ),
      );
      expect(tester.takeException(), isNull);
      expect(find.byType(Image), findsNothing);
    });
  });
}
