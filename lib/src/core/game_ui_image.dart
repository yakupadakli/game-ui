import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import 'constants.dart' show gameUiPackageName;

/// [Image.asset] scoped to the [gameUiPackageName] bundle.
abstract final class GameUiImage {
  GameUiImage._();

  /// Same as [Image.asset] with `package` set to [gameUiPackageName].
  static Image asset(
    String name, {
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    // Smooth scaling for the cartoon PNG frames the package ships (these are
    // not pixel-art — that would want FilterQuality.none for crisp edges).
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      name,
      package: gameUiPackageName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder ?? _fallbackErrorBuilder(name, width, height),
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  /// Graceful fallback for a missing or undecodable asset: logs in debug and
  /// shows a visible red marker so the broken path is caught early; in release
  /// it collapses to a size-preserving box so layout stays intact.
  static ImageErrorWidgetBuilder _fallbackErrorBuilder(
    String name,
    double? width,
    double? height,
  ) {
    return (context, error, stackTrace) {
      assert(() {
        debugPrint('GameUiImage: failed to load asset "$name" — $error');
        return true;
      }());
      if (kDebugMode) {
        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0x22FF0000),
            border: Border.all(color: const Color(0xFFFF0000)),
          ),
          child: const Icon(
            Icons.broken_image_outlined,
            color: Color(0xFFFF0000),
          ),
        );
      }
      return SizedBox(width: width, height: height);
    };
  }
}
