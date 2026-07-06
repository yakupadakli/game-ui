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

  group('GameBadge', () {
    testWidgets('renders its label', (tester) async {
      await pump(tester, const GameBadge(label: 'NEW'));

      expect(find.text('NEW'), findsOneWidget);
    });

    testWidgets('renders an optional leading icon', (tester) async {
      await pump(tester, const GameBadge(label: 'PRO', icon: Icon(Icons.bolt)));

      expect(find.byIcon(Icons.bolt), findsOneWidget);
      expect(find.text('PRO'), findsOneWidget);
    });
  });

  group('GameStarRating', () {
    testWidgets('draws one icon per star slot', (tester) async {
      await pump(tester, const GameStarRating(starCount: 2, maxStars: 5));

      expect(find.byIcon(Icons.star_rounded), findsNWidgets(5));
    });

    testWidgets('exposes the localized semantics label', (tester) async {
      await pump(tester, const GameStarRating(starCount: 2, maxStars: 5));

      expect(find.bySemanticsLabel('Star rating'), findsOneWidget);
    });

    testWidgets('semanticLabel overrides the default', (tester) async {
      await pump(
        tester,
        const GameStarRating(
          starCount: 1,
          maxStars: 3,
          semanticLabel: 'Level score',
        ),
      );

      expect(find.bySemanticsLabel('Level score'), findsOneWidget);
    });

    testWidgets('uses iconBuilder when provided', (tester) async {
      await pump(
        tester,
        GameStarRating(
          starCount: 1,
          maxStars: 3,
          iconBuilder: (context, index, isEarned) =>
              Text(isEarned ? 'on' : 'off'),
        ),
      );

      expect(find.text('on'), findsOneWidget);
      expect(find.text('off'), findsNWidgets(2));
    });
  });

  group('GameStatItem', () {
    testWidgets('renders icon, value, and label', (tester) async {
      await pump(
        tester,
        const GameStatItem(
          icon: Icons.local_fire_department,
          value: '12',
          label: 'Best streak',
        ),
      );

      expect(find.byIcon(Icons.local_fire_department), findsOneWidget);
      expect(find.text('12'), findsOneWidget);
      expect(find.text('Best streak'), findsOneWidget);
    });
  });
}
