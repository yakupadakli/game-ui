import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameTheme.lightTheme()', () {
    final theme = GameTheme.lightTheme();

    test('wires primary color from GameColors', () {
      expect(theme.colorScheme.primary, GameColors.primary);
    });

    test('wires error color from GameColors.danger', () {
      expect(theme.colorScheme.error, GameColors.danger);
    });

    test('scaffold background uses GameColors.background', () {
      expect(theme.scaffoldBackgroundColor, GameColors.background);
    });

    test('uses GameDesignTokens.fontFamily globally', () {
      expect(
        theme.textTheme.bodyLarge?.fontFamily,
        GameDesignTokens.fontFamily,
      );
    });

    test('useMaterial3 is enabled', () {
      expect(theme.useMaterial3, isTrue);
    });
  });
}
