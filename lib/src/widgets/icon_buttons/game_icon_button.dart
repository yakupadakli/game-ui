import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../animations/game_tap_scale.dart';

part 'game_icon_button_painters.dart';

/// Icon-button variants — a glyph (home / book / settings gear / play) drawn
/// entirely in code with a per-variant palette. Outline variants stroke the
/// silhouette only; filled variants add gradients and detail fills.
enum GameIconButtonVariant {
  book(_IconSpec.book),
  bookBlueOutline(_IconSpec.bookBlueOutline),
  bookGray(_IconSpec.bookGray),
  bookPurpleV2(_IconSpec.bookPurpleV2),
  home(_IconSpec.home),
  homeBlue(_IconSpec.homeBlue),
  homeOutline(_IconSpec.homeOutline),
  homePink(_IconSpec.homePink),
  homeRed(_IconSpec.homeRed),
  playGreen(_IconSpec.playGreen),
  settings(_IconSpec.settings),
  settingsGray(_IconSpec.settingsGray),
  settingsOutlineBlue(_IconSpec.settingsOutlineBlue),
  settingsWhite(_IconSpec.settingsWhite);

  const GameIconButtonVariant(this._spec);

  final _IconSpec _spec;
}

/// Tappable nav button whose glyph is rendered entirely in code. Press
/// feedback comes from [GameTapScale].
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
    Widget glyph = CustomPaint(
      size: Size.square(size),
      painter: _IconGlyphPainter(variant._spec),
    );
    if (semanticLabel != null) {
      glyph = Semantics(label: semanticLabel, button: true, child: glyph);
    }
    if (onTap == null) return glyph;
    return GameTapScale(onTap: onTap, child: glyph);
  }
}
