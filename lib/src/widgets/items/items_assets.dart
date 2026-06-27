import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled collectible item PNGs — props the player earns or interacts with
/// (keys, jars, scrolls, crystals, snowball).
abstract final class ItemAssets {
  ItemAssets._();

  static const String _root = '$kGameAssetRoot/items';

  static const String jarBlue = '$_root/jar_blue.png';
  static const String keyGold = '$_root/key_gold.png';
  static const String keyGolden = '$_root/key_golden.png';
  static const String magicScrollDiamond = '$_root/magic_scroll_diamond.png';
  static const String rockCrystalTeal = '$_root/rock_crystal_teal.png';
  static const String scrollMagic = '$_root/scroll_magic.png';
  static const String snowball = '$_root/snowball.png';

  static const List<String> all = [
    jarBlue,
    keyGold,
    keyGolden,
    magicScrollDiamond,
    rockCrystalTeal,
    scrollMagic,
    snowball,
  ];
}
