import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';
import '../../core/game_ui_image.dart';
import 'icon_buttons_assets.dart';

/// Icon-button art variants — the glyph (home / book / settings / play) is
/// baked into each PNG. Matches [IconButtonAssets].
enum GameIconButtonVariant {
  book(asset: IconButtonAssets.book),
  bookBlueOutline(asset: IconButtonAssets.bookBlueOutline),
  bookGray(asset: IconButtonAssets.bookGray),
  bookPurpleV2(asset: IconButtonAssets.bookPurpleV2),
  home(asset: IconButtonAssets.home),
  homeBlue(asset: IconButtonAssets.homeBlue),
  homeOutline(asset: IconButtonAssets.homeOutline),
  homePink(asset: IconButtonAssets.homePink),
  homeRed(asset: IconButtonAssets.homeRed),
  playGreen(asset: IconButtonAssets.playGreen),
  settings(asset: IconButtonAssets.settings),
  settingsGray(asset: IconButtonAssets.settingsGray),
  settingsOutlineBlue(asset: IconButtonAssets.settingsOutlineBlue),
  settingsWhite(asset: IconButtonAssets.settingsWhite);

  const GameIconButtonVariant({required this.asset});

  /// Bundled PNG path for this icon button.
  final String asset;
}

/// Tappable nav button whose glyph is part of the bundled art. Press feedback
/// comes from [GameTapScale].
class GameIconButton extends StatelessWidget {
  const GameIconButton({
    required this.variant,
    this.onTap,
    this.size = 64,
    this.semanticLabel,
    super.key,
  });

  final GameIconButtonVariant variant;
  final VoidCallback? onTap;
  final double size;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final image = GameUiImage.asset(
      variant.asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
      semanticLabel: semanticLabel,
    );
    if (onTap == null) return image;
    return GameTapScale(onTap: onTap, child: image);
  }
}
