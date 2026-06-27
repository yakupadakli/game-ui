import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled asset paths for button widgets.
abstract final class ButtonAssets {
  ButtonAssets._();

  static const String _root = '$kGameAssetRoot/buttons';

  /// Glossy 3D circular button base.
  static const String circle = '$_root/circle.png';

  /// Large rounded-rectangle color buttons (primary call-to-action style).
  static const String blue = '$_root/blue.png';
  static const String green = '$_root/green.png';
  static const String purple = '$_root/purple.png';
  static const String red = '$_root/red.png';

  /// Glossy circular icon-button bases.
  static const String circleBlueGlossy = '$_root/circle_blue_glossy.png';
  static const String circleWhiteGlossy = '$_root/circle_white_glossy.png';

  /// Glossy square icon-button bases.
  static const String squareBlueGlossy = '$_root/square_blue_glossy.png';
  static const String squareGreenGlossy = '$_root/square_green_glossy.png';
  static const String squareOrangeGlossy = '$_root/square_orange_glossy.png';
  static const String squareRedGlossy = '$_root/square_red_glossy.png';

  /// Orange pill / outline UI buttons (play, generic, empty, dot-badged).
  static const String orangeEmpty = '$_root/orange_empty.png';
  static const String orangePlay = '$_root/orange_play.png';
  static const String orangeWithDot = '$_root/orange_with_dot.png';
  static const String outlineWhite = '$_root/outline_white.png';

  /// Rounded-rectangle color buttons in declaration order.
  static const List<String> rectangles = [blue, green, purple, red];

  /// Glossy circle + square icon-button bases.
  static const List<String> glossy = [
    circleBlueGlossy,
    circleWhiteGlossy,
    squareBlueGlossy,
    squareGreenGlossy,
    squareOrangeGlossy,
    squareRedGlossy,
  ];

  /// Orange / outline UI buttons.
  static const List<String> ui = [
    orangeEmpty,
    orangePlay,
    orangeWithDot,
    outlineWhite,
  ];
}
