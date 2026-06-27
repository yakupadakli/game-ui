import 'package:flutter/widgets.dart';

import '../../core/game_ui_image.dart';
import 'xp_bars_assets.dart';

/// Empty-frame + fill pairings for [GameXpBar] — each style bundles a matching
/// empty track and filled track from [XpBarAssets].
enum GameXpBarStyle {
  blue(empty: XpBarAssets.frameBlueEmpty, fill: XpBarAssets.blueFull),
  purple(empty: XpBarAssets.framePurpleEmpty, fill: XpBarAssets.purpleFull),
  fire(empty: XpBarAssets.fireEmpty, fill: XpBarAssets.fireFull),
  rainbow(empty: XpBarAssets.empty, fill: XpBarAssets.rainbowGlossy),
  orange(empty: XpBarAssets.empty, fill: XpBarAssets.segmentedOrange);

  const GameXpBarStyle({required this.empty, required this.fill});

  /// Bundled empty-track PNG.
  final String empty;

  /// Bundled filled-track PNG (revealed left-to-right by progress).
  final String fill;
}

/// XP / progress bar composited from a bundled empty frame and a filled track
/// revealed left-to-right by [progress] (0..1).
///
/// Pick a [style] for a matched empty/fill pair, or override [emptyAsset] /
/// [fillAsset] with any [XpBarAssets] path. The fill is reveal-clipped (not
/// stretched), so the art keeps its proportions.
class GameXpBar extends StatelessWidget {
  const GameXpBar({
    required this.progress,
    this.style = GameXpBarStyle.fire,
    this.emptyAsset,
    this.fillAsset,
    this.width = 240,
    this.height = 32,
    this.child,
    super.key,
  });

  /// Fill fraction, clamped to 0..1.
  final double progress;
  final GameXpBarStyle style;

  /// Overrides [GameXpBarStyle.empty].
  final String? emptyAsset;

  /// Overrides [GameXpBarStyle.fill].
  final String? fillAsset;

  final double width;
  final double height;

  /// Optional centered overlay (e.g. a "120 / 200 XP" label).
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final p = progress.clamp(0.0, 1.0);
    final empty = emptyAsset ?? style.empty;
    final fill = fillAsset ?? style.fill;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        // Left-align so the fill reveal grows from the left edge. Children get
        // loose constraints here (not tight), so Align's widthFactor actually
        // shrink-wraps and ClipRect reveals only the left `p` fraction.
        alignment: Alignment.centerLeft,
        children: [
          GameUiImage.asset(
            empty,
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: p,
              child: GameUiImage.asset(
                fill,
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          if (child != null) Positioned.fill(child: Center(child: child!)),
        ],
      ),
    );
  }
}
