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

  // Field-parity guard: every string field must be wired through the presets,
  // copyWith, and GameUiStringsResolved. When adding a new field, extend the
  // `fullFields`/`presetFields`/`resolved*` lists below so the parity holds.
  group('GameUiStringsTheme field parity', () {
    // A fully-populated instance with a unique sentinel per field.
    final full = GameUiStringsTheme(
      dialogOk: 's_dialogOk',
      dialogCancel: 's_dialogCancel',
      searchDefaultHint: 's_searchDefaultHint',
      passwordShowTooltip: 's_passwordShowTooltip',
      passwordHideTooltip: 's_passwordHideTooltip',
      semanticRangeLabel: 's_semanticRangeLabel',
      semanticRangeSliderHint: 's_semanticRangeSliderHint',
      semanticStarRatingDefault: 's_semanticStarRatingDefault',
      semanticStarHalfHint: 's_semanticStarHalfHint',
      semanticDivider: 's_semanticDivider',
      semanticBanner: 's_semanticBanner',
      semanticLoading: 's_semanticLoading',
      semanticTooltip: 's_semanticTooltip',
      semanticSnackBar: 's_semanticSnackBar',
      semanticBottomSheet: 's_semanticBottomSheet',
      semanticDismiss: 's_semanticDismiss',
    );

    List<String?> fields(GameUiStringsTheme t) => [
      t.dialogOk,
      t.dialogCancel,
      t.searchDefaultHint,
      t.passwordShowTooltip,
      t.passwordHideTooltip,
      t.semanticRangeLabel,
      t.semanticRangeSliderHint,
      t.semanticStarRatingDefault,
      t.semanticStarHalfHint,
      t.semanticDivider,
      t.semanticBanner,
      t.semanticLoading,
      t.semanticTooltip,
      t.semanticSnackBar,
      t.semanticBottomSheet,
      t.semanticDismiss,
    ];

    List<String> resolvedValues(GameUiStringsResolved r) => [
      r.dialogOk,
      r.dialogCancel,
      r.searchDefaultHint,
      r.passwordShowTooltip,
      r.passwordHideTooltip,
      r.semanticRangeLabel,
      r.semanticRangeSliderHint,
      r.semanticStarRatingDefault,
      r.semanticStarHalfHint,
      r.semanticDivider,
      r.semanticBanner,
      r.semanticLoading,
      r.semanticTooltip,
      r.semanticSnackBar,
      r.semanticBottomSheet,
      r.semanticDismiss,
    ];

    test('.en() populates every field', () {
      expect(fields(GameUiStringsTheme.en()), everyElement(isNotNull));
    });

    test('.tr() populates every field', () {
      expect(fields(GameUiStringsTheme.tr()), everyElement(isNotNull));
    });

    test('.tr() has no duplicate values (each concept distinct)', () {
      final values = fields(GameUiStringsTheme.tr()).cast<String>();
      expect(values.toSet().length, values.length);
    });

    test('copyWith() preserves every field', () {
      expect(fields(full.copyWith()), fields(full));
    });

    test('resolved prefers the theme override for every field', () {
      expect(resolvedValues(GameUiStringsResolved(full)), fields(full));
    });

    test('resolved falls back to a non-empty default for every field', () {
      // A null theme must yield the package kGame* defaults — never empty.
      final defaults = resolvedValues(GameUiStringsResolved(null));
      expect(defaults, everyElement(isNotEmpty));
    });

    test('equality and hashCode cover every field', () {
      expect(full, equals(full.copyWith()));
      expect(full.hashCode, full.copyWith().hashCode);
      for (final mutated in [
        full.copyWith(dialogOk: 'x'),
        full.copyWith(semanticDismiss: 'x'),
        full.copyWith(semanticBanner: 'x'),
      ]) {
        expect(full, isNot(equals(mutated)));
      }
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
