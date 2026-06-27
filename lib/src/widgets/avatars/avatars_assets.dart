import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled avatar face PNGs — round character portraits for profile pickers.
abstract final class AvatarAssets {
  AvatarAssets._();

  static const String _root = '$kGameAssetRoot/avatars';

  static const String faceBoy = '$_root/face_boy.png';
  static const String faceGirl = '$_root/face_girl.png';

  static const List<String> all = [faceBoy, faceGirl];
}
