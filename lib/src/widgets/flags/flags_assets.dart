import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled flag PNGs — color checkpoint / goal flags for level maps.
abstract final class FlagAssets {
  FlagAssets._();

  static const String _root = '$kGameAssetRoot/flags';

  static const String blue = '$_root/blue.png';
  static const String green = '$_root/green.png';
  static const String pink = '$_root/pink.png';
  static const String purple = '$_root/purple.png';

  static const List<String> all = [blue, green, pink, purple];
}
