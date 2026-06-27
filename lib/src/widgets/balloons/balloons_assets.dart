import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled balloon PNGs — floating color balloons for celebration and ambient
/// decoration.
abstract final class BalloonAssets {
  BalloonAssets._();

  static const String _root = '$kGameAssetRoot/balloons';

  static const String blue = '$_root/blue.png';
  static const String green = '$_root/green.png';
  static const String purple = '$_root/purple.png';
  static const String yellow = '$_root/yellow.png';

  static const List<String> all = [blue, green, purple, yellow];
}
