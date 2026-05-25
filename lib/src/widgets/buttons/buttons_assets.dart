import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled asset paths for button widgets.
abstract final class ButtonAssets {
  ButtonAssets._();

  static const String _root = '$kGameAssetRoot/buttons';

  /// Glossy 3D circular button base.
  static const String circle = '$_root/circle.png';
}
