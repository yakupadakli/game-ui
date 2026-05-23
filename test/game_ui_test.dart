import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('game_ui scaffold', () {
    test('package name constant is correct', () {
      expect(gameUiPackageName, 'game_ui');
    });

    test('asset root constant is correct', () {
      expect(kGameAssetRoot, 'assets/images');
    });

    test('GameTheme.defaults() returns empty list initially', () {
      expect(GameTheme.defaults(), isEmpty);
    });
  });
}
