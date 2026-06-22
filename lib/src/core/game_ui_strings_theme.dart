import 'package:flutter/material.dart';

import 'game_ui_strings.dart';

/// Optional overrides for default English strings (dialogs, hints, semantics).
///
/// Register via [ThemeData.extensions] for localization or copy tweaks.
///
/// ```dart
/// ThemeData(
///   extensions: [
///     GameUiStringsTheme(dialogOk: 'Tamam', dialogCancel: 'Vazgeç'),
///   ],
/// )
/// ```
/// Builds the "Star N of M" semantic label.
typedef GameStarIndexLabel = String Function(int indexOneBased, int maxStars);

/// Builds the "All N steps completed" semantic label.
typedef GameStepAllCompletedLabel = String Function(int total);

/// Builds the "Step N of M, <label>" semantic label.
typedef GameStepCurrentLabel =
    String Function({
      required int stepDisplayOneBased,
      required int total,
      required String stepLabel,
    });

@immutable
class GameUiStringsTheme extends ThemeExtension<GameUiStringsTheme> {
  const GameUiStringsTheme({
    this.dialogOk,
    this.dialogCancel,
    this.searchDefaultHint,
    this.passwordShowTooltip,
    this.passwordHideTooltip,
    this.toggleOnLabel,
    this.toggleOffLabel,
    this.semanticRangeLabel,
    this.semanticRangeSliderHint,
    this.semanticStarRatingDefault,
    this.semanticStarHalfHint,
    this.semanticDivider,
    this.semanticBanner,
    this.semanticLoading,
    this.semanticTooltip,
    this.semanticSnackBar,
    this.semanticBottomSheet,
    this.semanticDismiss,
    this.semanticStarIndexLabel,
    this.semanticStepAllCompleted,
    this.semanticStepCurrent,
  });

  /// Explicit English preset; otherwise the default const constructor's null
  /// fallbacks return English.
  factory GameUiStringsTheme.en() => const GameUiStringsTheme(
    dialogOk: 'OK',
    dialogCancel: 'Cancel',
    searchDefaultHint: 'Search...',
    passwordShowTooltip: 'Show password',
    passwordHideTooltip: 'Hide password',
    toggleOnLabel: 'ON',
    toggleOffLabel: 'OFF',
    semanticRangeLabel: 'Range',
    semanticRangeSliderHint:
        'Drag each handle or tap the track to adjust the range',
    semanticStarRatingDefault: 'Star rating',
    semanticStarHalfHint: 'Left half or right half for different values',
    semanticDivider: 'Divider',
    semanticBanner: 'Banner',
    semanticLoading: 'Loading',
    semanticTooltip: 'Tooltip',
    semanticSnackBar: 'Notification',
    semanticBottomSheet: 'Bottom sheet',
    semanticDismiss: 'Dismiss',
    // Top-level tear-offs are canonical, so two .en() instances stay equal.
    semanticStarIndexLabel: kGameSemanticStarIndexLabel,
    semanticStepAllCompleted: kGameSemanticStepAllCompleted,
    semanticStepCurrent: kGameSemanticStepCurrent,
  );

  /// Explicit Turkish preset; otherwise the default const constructor's null
  /// fallbacks return English.
  factory GameUiStringsTheme.tr() => const GameUiStringsTheme(
    dialogOk: 'Tamam',
    dialogCancel: 'Vazgeç',
    searchDefaultHint: 'Ara...',
    passwordShowTooltip: 'Şifreyi göster',
    passwordHideTooltip: 'Şifreyi gizle',
    toggleOnLabel: 'AÇIK',
    toggleOffLabel: 'KAPALI',
    semanticRangeLabel: 'Aralık',
    semanticRangeSliderHint:
        'Aralığı ayarlamak için her tutamağı sürükleyin veya iz üzerine dokunun',
    semanticStarRatingDefault: 'Yıldız değerlendirmesi',
    semanticStarHalfHint: 'Farklı değerler için sol yarı veya sağ yarı',
    semanticDivider: 'Ayırıcı',
    semanticBanner: 'Afiş',
    semanticLoading: 'Yükleniyor',
    semanticTooltip: 'İpucu',
    semanticSnackBar: 'Bildirim',
    semanticBottomSheet: 'Alt panel',
    semanticDismiss: 'Kapat',
    // Top-level tear-offs are canonical, so two .tr() instances stay equal.
    semanticStarIndexLabel: _trStarIndexLabel,
    semanticStepAllCompleted: _trStepAllCompleted,
    semanticStepCurrent: _trStepCurrent,
  );

  /// Resolves a preset by [Locale.languageCode]. Returns [tr] for `'tr'`,
  /// otherwise [en].
  ///
  /// Deliberately avoids ARB / `flutter gen-l10n` / `intl` to keep the package
  /// dependency-free; consumers that need richer locale handling can build
  /// their own [GameUiStringsTheme] from their own translation system.
  static GameUiStringsTheme forLocale(Locale locale) {
    if (locale.languageCode == 'tr') return GameUiStringsTheme.tr();
    return GameUiStringsTheme.en();
  }

  final String? dialogOk;
  final String? dialogCancel;
  final String? searchDefaultHint;
  final String? passwordShowTooltip;
  final String? passwordHideTooltip;
  final String? toggleOnLabel;
  final String? toggleOffLabel;
  final String? semanticRangeLabel;
  final String? semanticRangeSliderHint;
  final String? semanticStarRatingDefault;
  final String? semanticStarHalfHint;
  final String? semanticDivider;
  final String? semanticBanner;
  final String? semanticLoading;
  final String? semanticTooltip;
  final String? semanticSnackBar;
  final String? semanticBottomSheet;
  final String? semanticDismiss;

  /// Override for the parameterized "Star N of M" semantic label. Falls back
  /// to [kGameSemanticStarIndexLabel] (English) when null.
  final GameStarIndexLabel? semanticStarIndexLabel;

  /// Override for "All N steps completed". Falls back to
  /// [kGameSemanticStepAllCompleted] (English) when null.
  final GameStepAllCompletedLabel? semanticStepAllCompleted;

  /// Override for "Step N of M, <label>". Falls back to
  /// [kGameSemanticStepCurrent] (English) when null.
  final GameStepCurrentLabel? semanticStepCurrent;

  static const GameUiStringsTheme empty = GameUiStringsTheme();

  @override
  GameUiStringsTheme copyWith({
    String? dialogOk,
    String? dialogCancel,
    String? searchDefaultHint,
    String? passwordShowTooltip,
    String? passwordHideTooltip,
    String? toggleOnLabel,
    String? toggleOffLabel,
    String? semanticRangeLabel,
    String? semanticRangeSliderHint,
    String? semanticStarRatingDefault,
    String? semanticStarHalfHint,
    String? semanticDivider,
    String? semanticBanner,
    String? semanticLoading,
    String? semanticTooltip,
    String? semanticSnackBar,
    String? semanticBottomSheet,
    String? semanticDismiss,
    GameStarIndexLabel? semanticStarIndexLabel,
    GameStepAllCompletedLabel? semanticStepAllCompleted,
    GameStepCurrentLabel? semanticStepCurrent,
  }) {
    return GameUiStringsTheme(
      dialogOk: dialogOk ?? this.dialogOk,
      dialogCancel: dialogCancel ?? this.dialogCancel,
      searchDefaultHint: searchDefaultHint ?? this.searchDefaultHint,
      passwordShowTooltip: passwordShowTooltip ?? this.passwordShowTooltip,
      passwordHideTooltip: passwordHideTooltip ?? this.passwordHideTooltip,
      toggleOnLabel: toggleOnLabel ?? this.toggleOnLabel,
      toggleOffLabel: toggleOffLabel ?? this.toggleOffLabel,
      semanticRangeLabel: semanticRangeLabel ?? this.semanticRangeLabel,
      semanticRangeSliderHint:
          semanticRangeSliderHint ?? this.semanticRangeSliderHint,
      semanticStarRatingDefault:
          semanticStarRatingDefault ?? this.semanticStarRatingDefault,
      semanticStarHalfHint: semanticStarHalfHint ?? this.semanticStarHalfHint,
      semanticDivider: semanticDivider ?? this.semanticDivider,
      semanticBanner: semanticBanner ?? this.semanticBanner,
      semanticLoading: semanticLoading ?? this.semanticLoading,
      semanticTooltip: semanticTooltip ?? this.semanticTooltip,
      semanticSnackBar: semanticSnackBar ?? this.semanticSnackBar,
      semanticBottomSheet: semanticBottomSheet ?? this.semanticBottomSheet,
      semanticDismiss: semanticDismiss ?? this.semanticDismiss,
      semanticStarIndexLabel:
          semanticStarIndexLabel ?? this.semanticStarIndexLabel,
      semanticStepAllCompleted:
          semanticStepAllCompleted ?? this.semanticStepAllCompleted,
      semanticStepCurrent: semanticStepCurrent ?? this.semanticStepCurrent,
    );
  }

  @override
  GameUiStringsTheme lerp(ThemeExtension<GameUiStringsTheme>? other, double t) {
    if (other is! GameUiStringsTheme) return this;
    if (t < 0.5) return this;
    return other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GameUiStringsTheme &&
        dialogOk == other.dialogOk &&
        dialogCancel == other.dialogCancel &&
        searchDefaultHint == other.searchDefaultHint &&
        passwordShowTooltip == other.passwordShowTooltip &&
        passwordHideTooltip == other.passwordHideTooltip &&
        toggleOnLabel == other.toggleOnLabel &&
        toggleOffLabel == other.toggleOffLabel &&
        semanticRangeLabel == other.semanticRangeLabel &&
        semanticRangeSliderHint == other.semanticRangeSliderHint &&
        semanticStarRatingDefault == other.semanticStarRatingDefault &&
        semanticStarHalfHint == other.semanticStarHalfHint &&
        semanticDivider == other.semanticDivider &&
        semanticBanner == other.semanticBanner &&
        semanticLoading == other.semanticLoading &&
        semanticTooltip == other.semanticTooltip &&
        semanticSnackBar == other.semanticSnackBar &&
        semanticBottomSheet == other.semanticBottomSheet &&
        semanticDismiss == other.semanticDismiss &&
        semanticStarIndexLabel == other.semanticStarIndexLabel &&
        semanticStepAllCompleted == other.semanticStepAllCompleted &&
        semanticStepCurrent == other.semanticStepCurrent;
  }

  @override
  int get hashCode => Object.hashAll([
    dialogOk,
    dialogCancel,
    searchDefaultHint,
    passwordShowTooltip,
    passwordHideTooltip,
    toggleOnLabel,
    toggleOffLabel,
    semanticRangeLabel,
    semanticRangeSliderHint,
    semanticStarRatingDefault,
    semanticStarHalfHint,
    semanticDivider,
    semanticBanner,
    semanticLoading,
    semanticTooltip,
    semanticSnackBar,
    semanticBottomSheet,
    semanticDismiss,
    semanticStarIndexLabel,
    semanticStepAllCompleted,
    semanticStepCurrent,
  ]);
}

/// Resolved strings: [GameUiStringsTheme] over package `kGame*` defaults.
extension GameUiStringsContext on BuildContext {
  GameUiStringsResolved get gameUiStrings =>
      GameUiStringsResolved(Theme.of(this).extension<GameUiStringsTheme>());
}

/// Bundle of resolved UI strings for the current [BuildContext].
class GameUiStringsResolved {
  GameUiStringsResolved(this._theme);

  final GameUiStringsTheme? _theme;

  String get dialogOk => _theme?.dialogOk ?? kGameDialogOk;

  String get dialogCancel => _theme?.dialogCancel ?? kGameDialogCancel;

  String get searchDefaultHint =>
      _theme?.searchDefaultHint ?? kGameSearchDefaultHint;

  String get passwordShowTooltip =>
      _theme?.passwordShowTooltip ?? kGamePasswordShowTooltip;

  String get passwordHideTooltip =>
      _theme?.passwordHideTooltip ?? kGamePasswordHideTooltip;

  String get toggleOnLabel => _theme?.toggleOnLabel ?? kGameToggleOnLabel;

  String get toggleOffLabel => _theme?.toggleOffLabel ?? kGameToggleOffLabel;

  String get semanticRangeLabel =>
      _theme?.semanticRangeLabel ?? kGameSemanticRangeDefaultLabel;

  String get semanticRangeSliderHint =>
      _theme?.semanticRangeSliderHint ?? kGameSemanticRangeSliderHint;

  String get semanticStarRatingDefault =>
      _theme?.semanticStarRatingDefault ?? kGameSemanticStarRatingDefault;

  String get semanticStarHalfHint =>
      _theme?.semanticStarHalfHint ?? kGameSemanticStarHalfHint;

  String get semanticDivider =>
      _theme?.semanticDivider ?? kGameSemanticDividerDefault;

  String get semanticBanner =>
      _theme?.semanticBanner ?? kGameSemanticBannerDefault;

  String get semanticLoading =>
      _theme?.semanticLoading ?? kGameSemanticLoadingDefault;

  String get semanticTooltip =>
      _theme?.semanticTooltip ?? kGameSemanticTooltipDefault;

  String get semanticSnackBar =>
      _theme?.semanticSnackBar ?? kGameSemanticSnackBarDefault;

  String get semanticBottomSheet =>
      _theme?.semanticBottomSheet ?? kGameSemanticBottomSheetDefault;

  String get semanticDismiss =>
      _theme?.semanticDismiss ?? kGameSemanticDismissDefault;

  GameStarIndexLabel get semanticStarIndexLabel =>
      _theme?.semanticStarIndexLabel ?? kGameSemanticStarIndexLabel;

  GameStepAllCompletedLabel get semanticStepAllCompleted =>
      _theme?.semanticStepAllCompleted ?? kGameSemanticStepAllCompleted;

  GameStepCurrentLabel get semanticStepCurrent =>
      _theme?.semanticStepCurrent ?? kGameSemanticStepCurrent;
}

// Turkish counterparts of the parameterized labels. Kept as top-level
// functions so their tear-offs are canonical — two `.tr()` instances compare
// equal, avoiding spurious ThemeExtension rebuilds.
String _trStarIndexLabel(int indexOneBased, int maxStars) =>
    '$maxStars yıldızdan $indexOneBased. yıldız';

String _trStepAllCompleted(int total) => '$total adımın tümü tamamlandı';

String _trStepCurrent({
  required int stepDisplayOneBased,
  required int total,
  required String stepLabel,
}) => 'Adım $stepDisplayOneBased / $total, $stepLabel';
