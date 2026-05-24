import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_ui/game_ui.dart';

void main() {
  group('GameUiStringsTheme', () {
    test('.en() provides English dialog labels', () {
      final theme = GameUiStringsTheme.en();
      expect(theme.dialogOk, 'OK');
      expect(theme.dialogCancel, 'Cancel');
    });

    test('.tr() provides Turkish dialog labels', () {
      final theme = GameUiStringsTheme.tr();
      expect(theme.dialogOk, 'Tamam');
      expect(theme.dialogCancel, 'Vazgeç');
    });

    test('.forLocale("tr") returns Turkish preset', () {
      final theme = GameUiStringsTheme.forLocale(const Locale('tr'));
      expect(theme.dialogOk, 'Tamam');
    });

    test('.forLocale("en") returns English preset', () {
      final theme = GameUiStringsTheme.forLocale(const Locale('en'));
      expect(theme.dialogOk, 'OK');
    });

    test('.forLocale(unknown) falls back to English', () {
      final theme = GameUiStringsTheme.forLocale(const Locale('de'));
      expect(theme.dialogOk, 'OK');
    });

    test('empty constant has all nullable fields null', () {
      expect(GameUiStringsTheme.empty.dialogOk, isNull);
      expect(GameUiStringsTheme.empty.dialogCancel, isNull);
    });

    test('copyWith preserves untouched fields', () {
      final original = GameUiStringsTheme.en();
      final copy = original.copyWith(dialogOk: 'Sure');
      expect(copy.dialogOk, 'Sure');
      expect(copy.dialogCancel, original.dialogCancel);
    });
  });

  group('GameUiStringsContext', () {
    testWidgets('falls back to package defaults when no theme extension', (
      tester,
    ) async {
      late GameUiStringsResolved resolved;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              resolved = context.gameUiStrings;
              return const SizedBox();
            },
          ),
        ),
      );
      expect(resolved.dialogOk, kGameDialogOk);
      expect(resolved.dialogCancel, kGameDialogCancel);
    });

    testWidgets('uses theme extension when registered', (tester) async {
      late GameUiStringsResolved resolved;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [GameUiStringsTheme.tr()]),
          home: Builder(
            builder: (context) {
              resolved = context.gameUiStrings;
              return const SizedBox();
            },
          ),
        ),
      );
      expect(resolved.dialogOk, 'Tamam');
      expect(resolved.dialogCancel, 'Vazgeç');
    });
  });
}
