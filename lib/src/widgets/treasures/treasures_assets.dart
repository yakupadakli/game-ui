import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled treasure-chest PNGs — closed/open states in gold and silver, plus
/// reward-spill variants (coins, stars, gems, glow).
abstract final class TreasureAssets {
  TreasureAssets._();

  static const String _root = '$kGameAssetRoot/treasures';

  // Closed.
  static const String closedGold = '$_root/closed_gold.png';
  static const String closedSilver = '$_root/closed_silver.png';
  static const String chestClosed = '$_root/chest_closed.png';

  // Open.
  static const String openCoinsGold = '$_root/open_coins_gold.png';
  static const String openGlowGold = '$_root/open_glow_gold.png';
  static const String openStarsSilver = '$_root/open_stars_silver.png';
  static const String chestOpenGems = '$_root/chest_open_gems.png';

  /// Neutral chest (state-agnostic illustration).
  static const String chest = '$_root/chest.png';

  static const List<String> closed = [closedGold, closedSilver, chestClosed];

  static const List<String> open = [
    openCoinsGold,
    openGlowGold,
    openStarsSilver,
    chestOpenGems,
  ];

  static const List<String> all = [chest, ...closed, ...open];
}
