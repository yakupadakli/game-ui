import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui_example/main.dart';

void main() {
  testWidgets('Gallery renders title', (tester) async {
    await tester.pumpWidget(const GameUiExampleApp());
    expect(find.text('game_ui Gallery'), findsOneWidget);
  });
}
