import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled award PNGs — medals, trophies, badges, ribbons, and presentation
/// stars used on result screens and achievement shelves.
abstract final class AwardAssets {
  AwardAssets._();

  static const String _root = '$kGameAssetRoot/awards';

  // Medals.
  static const String medalBronze = '$_root/medal_bronze.png';
  static const String medalSilver = '$_root/medal_silver.png';
  static const String medalGold = '$_root/medal_gold.png';

  // Trophies.
  static const String trophyGold = '$_root/trophy_gold.png';
  static const String trophyGoldStar = '$_root/trophy_gold_star.png';
  static const String trophyOutline = '$_root/trophy_outline.png';
  static const String trophyOutlineThick = '$_root/trophy_outline_thick.png';
  static const String trophyOutlineV2 = '$_root/trophy_outline_v2.png';
  static const String trophyStar = '$_root/trophy_star.png';
  static const String trophyStarV2 = '$_root/trophy_star_v2.png';

  // Badges / ribbons.
  static const String badgeGoldPawCongrats =
      '$_root/badge_gold_paw_congrats.png';
  static const String badgeRedGoldStar = '$_root/badge_red_gold_star.png';
  static const String ribbonBlueMedal = '$_root/ribbon_blue_medal.png';

  // Presentation stars.
  static const String starBlueGlossy = '$_root/star_blue_glossy.png';
  static const String starCoinBlueCombo = '$_root/star_coin_blue_combo.png';
  static const String starGoldFaceted = '$_root/star_gold_faceted.png';
  static const String starGoldGlossy = '$_root/star_gold_glossy.png';
  static const String starSingle = '$_root/star_single.png';
  static const String starsTriple = '$_root/stars_triple.png';

  static const List<String> medals = [medalBronze, medalSilver, medalGold];

  static const List<String> trophies = [
    trophyGold,
    trophyGoldStar,
    trophyOutline,
    trophyOutlineThick,
    trophyOutlineV2,
    trophyStar,
    trophyStarV2,
  ];

  static const List<String> badges = [
    badgeGoldPawCongrats,
    badgeRedGoldStar,
    ribbonBlueMedal,
  ];

  static const List<String> stars = [
    starBlueGlossy,
    starCoinBlueCombo,
    starGoldFaceted,
    starGoldGlossy,
    starSingle,
    starsTriple,
  ];

  static const List<String> all = [...medals, ...trophies, ...badges, ...stars];
}
