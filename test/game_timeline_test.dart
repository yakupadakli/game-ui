import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameTimeline', () {
    testWidgets('renders a row for every entry', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GameTimeline(
              entries: [
                GameTimelineEntry(child: Text('Started'), completed: true),
                GameTimelineEntry(child: Text('In progress')),
                GameTimelineEntry(child: Text('Locked')),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Started'), findsOneWidget);
      expect(find.text('In progress'), findsOneWidget);
      expect(find.text('Locked'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
