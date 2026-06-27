import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled XP / progress-bar PNGs — empty frames and filled tracks in several
/// themes. Pair an `*Empty` frame with a matching fill, clipped to progress.
abstract final class XpBarAssets {
  XpBarAssets._();

  static const String _root = '$kGameAssetRoot/xp_bars';

  // Empty frames.
  static const String empty = '$_root/empty.png';
  static const String emptyV2 = '$_root/empty_v2.png';
  static const String emptyV3 = '$_root/empty_v3.png';
  static const String frameBlueEmpty = '$_root/frame_blue_empty.png';
  static const String framePurpleEmpty = '$_root/frame_purple_empty.png';
  static const String fireEmpty = '$_root/fire_empty.png';

  // Filled tracks.
  static const String blueFull = '$_root/blue_full.png';
  static const String blueV2 = '$_root/blue_v2.png';
  static const String purpleFull = '$_root/purple_full.png';
  static const String fireFull = '$_root/fire_full.png';
  static const String fireHalf = '$_root/fire_half.png';
  static const String fireOrange = '$_root/fire_orange.png';
  static const String rainbowGlossy = '$_root/rainbow_glossy.png';
  static const String rainbowSegmented = '$_root/rainbow_segmented.png';
  static const String segmentedOrange = '$_root/segmented_orange.png';

  // Labeled (with leading badge baked in).
  static const String fireLabel = '$_root/fire_label.png';
  static const String fireLabelV2 = '$_root/fire_label_v2.png';

  static const List<String> empties = [
    empty,
    emptyV2,
    emptyV3,
    frameBlueEmpty,
    framePurpleEmpty,
    fireEmpty,
  ];

  static const List<String> fills = [
    blueFull,
    blueV2,
    purpleFull,
    fireFull,
    fireHalf,
    fireOrange,
    rainbowGlossy,
    rainbowSegmented,
    segmentedOrange,
  ];

  static const List<String> labeled = [fireLabel, fireLabelV2];

  static const List<String> all = [...empties, ...fills, ...labeled];
}
