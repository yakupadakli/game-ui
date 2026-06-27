import '../../core/constants.dart' show kGameAssetRoot;

/// Bundled panel / speech-bubble PNGs — framed surfaces that sit behind text
/// content (answer boxes, wood boards, answer bubbles).
abstract final class PanelAssets {
  PanelAssets._();

  static const String _root = '$kGameAssetRoot/panels';

  static const String cardBlue = '$_root/card_blue.png';
  static const String answerBoxBlue = '$_root/answer_box_blue.png';
  static const String woodBoardVine = '$_root/wood_board_vine.png';
  static const String bubbleAnswer = '$_root/bubble_answer.png';

  static const List<String> all = [
    cardBlue,
    answerBoxBlue,
    woodBoardVine,
    bubbleAnswer,
  ];
}
