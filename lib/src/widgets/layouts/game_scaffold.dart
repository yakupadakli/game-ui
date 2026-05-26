import 'package:flutter/material.dart';

import '../backgrounds/backgrounds_assets.dart';
import '../backgrounds/game_background.dart';

/// Game-themed [Scaffold] wrapper — paints a bundled background PNG behind
/// the body, with an optional [appBar] that extends behind the status bar.
///
/// Defaults:
/// - [backgroundAsset]: [BackgroundAssets.bg3]
/// - [extendBodyBehindAppBar]: true (so [GameAppBar] floats over the art)
/// - [safeArea]: true (wraps [body] in [SafeArea])
class GameScaffold extends StatelessWidget {
  const GameScaffold({
    required this.body,
    this.backgroundAsset = BackgroundAssets.bg3,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = true,
    this.safeArea = true,
    super.key,
  });

  final Widget body;
  final String backgroundAsset;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final bool safeArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      extendBody: true,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: GameBackground(
        asset: backgroundAsset,
        child: safeArea ? SafeArea(child: body) : body,
      ),
    );
  }
}
