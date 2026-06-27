import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled spin-wheel PNG — the segmented reward wheel base.
abstract final class SpinWheelAssets {
  SpinWheelAssets._();

  static const String _root = '$kGameAssetRoot/spin_wheel';

  static const String wheel = '$_root/wheel.png';

  static const List<String> all = [wheel];
}
