import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled arithmetic-operation label PNGs — themed signs for the four
/// operations, used as level/section headers.
abstract final class OperationAssets {
  OperationAssets._();

  static const String _root = '$kGameAssetRoot/operations';

  static const String addition = '$_root/addition.png';
  static const String subtraction = '$_root/subtraction.png';
  static const String multiplication = '$_root/multiplication.png';
  static const String division = '$_root/division.png';

  static const List<String> all = [
    addition,
    subtraction,
    multiplication,
    division,
  ];
}
