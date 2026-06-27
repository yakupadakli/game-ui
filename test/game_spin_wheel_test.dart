import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameSpinWheel', () {
    testWidgets('spinTo animates and reports the landed index', (tester) async {
      final controller = GameSpinWheelController();
      int? landed;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: GameSpinWheel(
                controller: controller,
                segments: 8,
                spinDuration: const Duration(milliseconds: 100),
                onSpinEnd: (i) => landed = i,
              ),
            ),
          ),
        ),
      );

      Matrix4 wheelMatrix() => tester
          .widget<Transform>(
            find
                .descendant(
                  of: find.byType(GameSpinWheel),
                  matching: find.byType(Transform),
                )
                .first,
          )
          .transform
          .clone();

      final atRest = wheelMatrix();

      controller.spinTo(3);
      await tester.pump(); // kick off the animation
      await tester.pump(const Duration(milliseconds: 50)); // mid-spin
      final midSpin = wheelMatrix();

      await tester.pumpAndSettle();

      // The wheel actually rotated (AnimatedBuilder ticked the new tween)...
      expect(midSpin, isNot(atRest));
      // ...and the controller's target was reported.
      expect(landed, 3);
    });

    testWidgets('ignores a second spin while already spinning', (tester) async {
      final controller = GameSpinWheelController();
      final reported = <int>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GameSpinWheel(
              controller: controller,
              segments: 6,
              spinDuration: const Duration(milliseconds: 100),
              onSpinEnd: reported.add,
            ),
          ),
        ),
      );

      controller.spinTo(1);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 20));
      controller.spinTo(4); // should be ignored — already animating
      await tester.pumpAndSettle();

      expect(reported, [1]);
    });
  });
}
