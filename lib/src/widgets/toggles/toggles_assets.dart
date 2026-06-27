import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled toggle PNGs — illustrated switch tracks for the asset-backed
/// [GameToggle] variant.
abstract final class ToggleAssets {
  ToggleAssets._();

  static const String _root = '$kGameAssetRoot/toggles';

  /// Green "on" track illustration.
  static const String onGreen = '$_root/on_green.png';

  static const List<String> all = [onGreen];
}
