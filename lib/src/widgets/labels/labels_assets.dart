import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled cloud-shaped label / button PNGs — soft rounded plates that sit
/// behind a short caption (level name, prompt).
abstract final class LabelAssets {
  LabelAssets._();

  static const String _root = '$kGameAssetRoot/labels';

  static const String cloud = '$_root/cloud.png';
  static const String cloudGreen = '$_root/cloud_green.png';

  static const List<String> all = [cloud, cloudGreen];
}
