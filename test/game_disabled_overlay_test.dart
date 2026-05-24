import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameDisabledOverlay', () {
    testWidgets('returns child untouched when not disabled', (tester) async {
      const key = Key('child');
      await tester.pumpWidget(
        const GameDisabledOverlay(
          disabled: false,
          child: SizedBox(key: key, width: 10, height: 10),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
      expect(find.byType(Opacity), findsNothing);
    });

    testWidgets('wraps child in Opacity when disabled', (tester) async {
      await tester.pumpWidget(
        const GameDisabledOverlay(
          disabled: true,
          child: SizedBox(width: 10, height: 10),
        ),
      );
      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, kGameDisabledOpacity);
    });
  });
}
