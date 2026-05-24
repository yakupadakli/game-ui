import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameColors semantic aliases', () {
    test('primary maps to vibrantBlue', () {
      expect(GameColors.primary, GameColors.vibrantBlue);
    });

    test('warning maps to sunnyYellow', () {
      expect(GameColors.warning, GameColors.sunnyYellow);
    });

    test('success maps to grassGreen', () {
      expect(GameColors.success, GameColors.grassGreen);
    });

    test('danger maps to friendlyOrange', () {
      expect(GameColors.danger, GameColors.friendlyOrange);
    });

    test('accent maps to purple', () {
      expect(GameColors.accent, GameColors.purple);
    });
  });
}
