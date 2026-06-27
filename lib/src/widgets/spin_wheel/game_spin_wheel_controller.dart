import 'package:flutter/foundation.dart';

/// Drives a [GameSpinWheel]: call [spinTo] to spin to a target segment.
///
/// A single command object so the wheel stays declarative — the widget listens
/// and runs the animation, then reports the landed index via its `onSpinEnd`.
class GameSpinWheelController extends ChangeNotifier {
  int? _pendingIndex;
  int _extraTurns = 5;

  /// Target segment index requested by the latest [spinTo] (consumed by the
  /// widget). Null before any spin.
  int? get pendingIndex => _pendingIndex;

  /// Number of full turns to spin before landing, for the latest request.
  int get extraTurns => _extraTurns;

  /// Spin so segment [index] comes to rest under the top pointer, after
  /// [extraTurns] full revolutions of build-up.
  void spinTo(int index, {int extraTurns = 5}) {
    assert(extraTurns >= 0, 'extraTurns must be non-negative');
    _pendingIndex = index;
    _extraTurns = extraTurns;
    notifyListeners();
  }
}
