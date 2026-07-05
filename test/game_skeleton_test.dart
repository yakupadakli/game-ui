import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameSkeleton', () {
    testWidgets('mounts and runs its shimmer animation', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(child: GameSkeleton(width: 120, height: 16)),
          ),
        ),
      );

      expect(find.byType(GameSkeleton), findsOneWidget);
      // The shimmer sweep repeats forever, so an animation is always running.
      expect(tester.hasRunningAnimations, isTrue);
    });

    testWidgets('disposes cleanly without throwing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: GameSkeleton())),
      );
      await tester.pumpWidget(const MaterialApp(home: Scaffold()));

      expect(tester.takeException(), isNull);
    });
  });
}
