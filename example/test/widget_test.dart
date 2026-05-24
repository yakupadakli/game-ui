import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui_example/main.dart';

void main() {
  testWidgets('HomePage renders title and index card', (tester) async {
    await tester.pumpWidget(const GameUiExampleApp());
    await tester.pumpAndSettle();

    expect(find.text('game_ui'), findsWidgets);
    expect(find.text('Gallery (single screen)'), findsOneWidget);
    expect(find.text('GameColors'), findsOneWidget);
  });
}
