import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled decorative PNGs — clouds and flowers used as ambient scenery and
/// scene dressing.
abstract final class DecorationAssets {
  DecorationAssets._();

  static const String _root = '$kGameAssetRoot/decorations';

  // Clouds.
  static const String cloud = '$_root/cloud.png';
  static const String cloudPartlySunny = '$_root/cloud_partly_sunny.png';
  static const String cloudRain = '$_root/cloud_rain.png';
  static const String cloudDecoration = '$_root/cloud_decoration.png';

  // Flowers.
  static const String flowerBlue = '$_root/flower_blue.png';
  static const String flowerRed = '$_root/flower_red.png';
  static const String flowerYellow = '$_root/flower_yellow.png';

  static const List<String> clouds = [
    cloud,
    cloudPartlySunny,
    cloudRain,
    cloudDecoration,
  ];

  static const List<String> flowers = [flowerBlue, flowerRed, flowerYellow];

  static const List<String> all = [...clouds, ...flowers];
}
