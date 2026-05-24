import 'package:flutter/widgets.dart';

/// [LayoutBuilder] + non-finite width guard for horizontal-asset widgets.
///
/// When `constraints.maxWidth` is non-finite or non-positive, returns
/// [fallback] (typically a height-preserving `SizedBox`). Otherwise calls
/// [builder] with the resolved positive width.
///
/// Use in any horizontal asset-stretched widget (banners, dividers, progress
/// indicators, step indicators) to avoid repeating the same width guard.
Widget gameHorizontalAssetLayout({
  required Widget fallback,
  required Widget Function(BuildContext context, double width) builder,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final w = constraints.maxWidth;
      if (!w.isFinite || w <= 0) return fallback;
      return builder(context, w);
    },
  );
}
