import 'package:flutter/material.dart';

import '../../core/game_colors.dart';
import '../../core/game_design_tokens.dart';
import '../buttons/game_return_button.dart';
import '../text/game_stroked_title.dart';

/// Transparent [AppBar] with a chunky stroked title and an optional
/// [GameReturnButton] in the leading slot.
///
/// Designed to sit on top of a [GameBackground] / [GameScaffold] so the
/// background art shows through. The leading back button is shown by default;
/// pass `showBackButton: false` to hide it.
class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GameAppBar({
    required this.title,
    this.titleFontSize = GameDesignTokens.font2XL,
    this.titleStrokeColor = GameColors.primary,
    this.onBack,
    this.showBackButton = true,
    this.actions,
    this.toolbarHeight = kToolbarHeight,
    super.key,
  });

  final String title;
  final double titleFontSize;
  final Color titleStrokeColor;
  final VoidCallback? onBack;
  final bool showBackButton;
  final List<Widget>? actions;
  final double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: toolbarHeight,
      leading: showBackButton ? _buildLeading(context) : null,
      centerTitle: true,
      title: GameStrokedTitle(
        title,
        fontSize: titleFontSize,
        strokeColor: titleStrokeColor,
      ),
      actions: actions,
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: GameDesignTokens.spacingSM),
      child: GameReturnButton(
        onTap: onBack ?? () => Navigator.maybePop(context),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
