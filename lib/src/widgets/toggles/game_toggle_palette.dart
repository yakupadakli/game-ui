import 'package:flutter/widgets.dart';

/// Color variation for [GameToggle]: the knob face + label colors for each
/// state. Drop shadows and label shadows are derived automatically (and adapt
/// to the label's lightness, so a dark label on a light knob stays readable).
///
/// Two presets ship; build your own with the constructor for a custom
/// variation.
@immutable
class GameTogglePalette {
  const GameTogglePalette({
    required this.onColor,
    required this.onLabelColor,
    required this.offColor,
    required this.offLabelColor,
  });

  /// Knob face color when on (the rim / lip / edge derive from it).
  final Color onColor;

  /// Knob label color when on.
  final Color onLabelColor;

  /// Knob face color when off.
  final Color offColor;

  /// Knob label color when off.
  final Color offLabelColor;

  /// Default look: green knob on, bright near-white knob off with a dark label.
  static const light = GameTogglePalette(
    onColor: Color(0xFF4FC862),
    onLabelColor: Color(0xFFFFFFFF),
    offColor: Color(0xFFEDF0F3),
    offLabelColor: Color(0xFF8B9298),
  );

  /// Earlier look: green knob on, muted grey knob off with a white label.
  static const grey = GameTogglePalette(
    onColor: Color(0xFF4FC862),
    onLabelColor: Color(0xFFFFFFFF),
    offColor: Color(0xFFABB7C3),
    offLabelColor: Color(0xFFFFFFFF),
  );

  /// Copy with selected fields overridden.
  GameTogglePalette copyWith({
    Color? onColor,
    Color? onLabelColor,
    Color? offColor,
    Color? offLabelColor,
  }) {
    return GameTogglePalette(
      onColor: onColor ?? this.onColor,
      onLabelColor: onLabelColor ?? this.onLabelColor,
      offColor: offColor ?? this.offColor,
      offLabelColor: offLabelColor ?? this.offLabelColor,
    );
  }
}
