import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled currency / coin PNGs — reward tokens for scores and shops.
abstract final class CurrencyAssets {
  CurrencyAssets._();

  static const String _root = '$kGameAssetRoot/currencies';

  /// Single coin stamped with a star.
  static const String coinStar = '$_root/coin_star.png';

  /// Stack of gold coins.
  static const String coinsStackGold = '$_root/coins_stack_gold.png';

  /// Pair of gold star-coins (double reward).
  static const String coinGoldStarDouble = '$_root/coin_gold_star_double.png';

  static const List<String> all = [
    coinStar,
    coinsStackGold,
    coinGoldStarDouble,
  ];
}
