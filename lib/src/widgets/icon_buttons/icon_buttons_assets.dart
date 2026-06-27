import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled icon-button PNGs — square/circular nav buttons that carry a glyph
/// (home, book, settings, play) baked into the art, in several color and
/// outline treatments.
abstract final class IconButtonAssets {
  IconButtonAssets._();

  static const String _root = '$kGameAssetRoot/icon_buttons';

  // Book.
  static const String book = '$_root/book.png';
  static const String bookBlueOutline = '$_root/book_blue_outline.png';
  static const String bookGray = '$_root/book_gray.png';
  static const String bookPurpleV2 = '$_root/book_purple_v2.png';

  // Home.
  static const String home = '$_root/home.png';
  static const String homeBlue = '$_root/home_blue.png';
  static const String homeOutline = '$_root/home_outline.png';
  static const String homePink = '$_root/home_pink.png';
  static const String homeRed = '$_root/home_red.png';

  // Play.
  static const String playGreen = '$_root/play_green.png';

  // Settings.
  static const String settings = '$_root/settings.png';
  static const String settingsGray = '$_root/settings_gray.png';
  static const String settingsOutlineBlue = '$_root/settings_outline_blue.png';
  static const String settingsWhite = '$_root/settings_white.png';

  static const List<String> all = [
    book,
    bookBlueOutline,
    bookGray,
    bookPurpleV2,
    home,
    homeBlue,
    homeOutline,
    homePink,
    homeRed,
    playGreen,
    settings,
    settingsGray,
    settingsOutlineBlue,
    settingsWhite,
  ];
}
