import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled colored frame PNGs — decorative rounded panels with brand-colored
/// rims. Used as card backgrounds, profile boards, dialog frames.
abstract final class FrameAssets {
  FrameAssets._();

  static const String _root = '$kGameAssetRoot/frames';

  static const String blue = '$_root/frame_blue.png';
  static const String green = '$_root/frame_green.png';
  static const String orange = '$_root/frame_orange.png';
  static const String purple = '$_root/frame_purple.png';
  static const String yellow = '$_root/frame_yellow.png';

  static const List<String> all = [blue, green, orange, purple, yellow];
}
