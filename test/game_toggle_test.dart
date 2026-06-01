import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  Future<void> pumpToggle(
    WidgetTester tester, {
    required bool value,
    ValueChanged<bool>? onChanged,
    bool enabled = true,
    String onLabel = 'ON',
    String offLabel = 'OFF',
  }) {
    return tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: GameToggle(
              value: value,
              onChanged: onChanged,
              enabled: enabled,
              onLabel: onLabel,
              offLabel: offLabel,
            ),
          ),
        ),
      ),
    );
  }

  group('GameToggle', () {
    testWidgets('tapping an on toggle reports false', (tester) async {
      bool? reported;
      await pumpToggle(tester, value: true, onChanged: (v) => reported = v);

      await tester.tap(find.byType(GameToggle));
      expect(reported, isFalse);
    });

    testWidgets('tapping an off toggle reports true', (tester) async {
      bool? reported;
      await pumpToggle(tester, value: false, onChanged: (v) => reported = v);

      await tester.tap(find.byType(GameToggle));
      expect(reported, isTrue);
    });

    testWidgets('enabled: false ignores taps', (tester) async {
      var called = false;
      await pumpToggle(
        tester,
        value: true,
        enabled: false,
        onChanged: (_) => called = true,
      );

      await tester.tap(find.byType(GameToggle), warnIfMissed: false);
      expect(called, isFalse);
    });

    testWidgets('null onChanged is non-interactive and does not throw', (
      tester,
    ) async {
      await pumpToggle(tester, value: true, onChanged: null);

      await tester.tap(find.byType(GameToggle), warnIfMissed: false);
      expect(tester.takeException(), isNull);
    });

    testWidgets('renders both custom labels (knob + track)', (tester) async {
      await pumpToggle(
        tester,
        value: true,
        onChanged: (_) {},
        onLabel: 'YES',
        offLabel: 'NO',
      );

      // Each label appears twice: once on the knob, once on the track.
      expect(find.text('YES'), findsWidgets);
      expect(find.text('NO'), findsWidgets);
    });

    testWidgets('animates when the controlled value changes', (tester) async {
      await pumpToggle(tester, value: true, onChanged: (_) {});
      await pumpToggle(tester, value: false, onChanged: (_) {});

      // Mid-transition there should be a running animation to settle.
      await tester.pump(const Duration(milliseconds: 50));
      expect(tester.hasRunningAnimations, isTrue);

      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, isFalse);
    });
  });
}
