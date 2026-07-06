import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled panel PNGs. Only the illustrated wood board remains — the other
/// panel looks are rendered entirely in code by `GamePanel` /
/// `GameSpeechBubble`.
abstract final class PanelAssets {
  PanelAssets._();

  static const String _root = '$kGameAssetRoot/panels';

  static const String woodBoardVine = '$_root/wood_board_vine.png';

  static const List<String> all = [woodBoardVine];
}
