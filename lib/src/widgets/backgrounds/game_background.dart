import 'package:flutter/widgets.dart';

import '../../core/constants.dart' show gameUiPackageName;
import 'backgrounds_assets.dart';

/// Fills its parent with a bundled background PNG, with [child] painted on
/// top. Use as the body of a [Scaffold] when you want a themed full-screen
/// surface.
///
/// Default [asset] is [BackgroundAssets.bg3] (a calm playful background).
/// Pass any path string for custom artwork (the package scope is still
/// applied — caller-provided absolute asset paths from a host app should
/// instead use a plain [Image.asset] + [Container]).
class GameBackground extends StatelessWidget {
  const GameBackground({
    required this.child,
    this.asset = BackgroundAssets.bg3,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    super.key,
  });

  final Widget child;
  final String asset;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset, package: gameUiPackageName),
          fit: fit,
          alignment: alignment,
        ),
      ),
      child: child,
    );
  }
}
