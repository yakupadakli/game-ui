import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'doc_widgets.dart';
import 'game_action_button_page.dart';
import 'game_avatar_item_page.dart';
import 'game_backgrounds_page.dart';
import 'game_banner_page.dart';
import 'game_blinking_cursor_page.dart';
import 'game_bottom_sheet_page.dart';
import 'game_button_page.dart';
import 'game_chip_page.dart';
import 'game_colors_page.dart';
import 'game_content_card_page.dart';
import 'game_design_tokens_page.dart';
import 'game_dialog_page.dart';
import 'game_difficulty_button_page.dart';
import 'game_disabled_overlay_page.dart';
import 'game_divider_page.dart';
import 'game_empty_state_page.dart';
import 'game_feedback_overlay_page.dart';
import 'game_frames_page.dart';
import 'game_gallery_page.dart';
import 'game_icons_page.dart';
import 'game_indicators_page.dart';
import 'game_input_display_page.dart';
import 'game_keyboard_page.dart';
import 'game_layouts_page.dart';
import 'game_mascots_page.dart';
import 'game_numpad_page.dart';
import 'game_page_indicator_page.dart';
import 'game_painters_page.dart';
import 'game_premium_badge_page.dart';
import 'game_progress_bar_page.dart';
import 'game_result_card_page.dart';
import 'game_return_button_page.dart';
import 'game_skeleton_page.dart';
import 'game_snack_bar_page.dart';
import 'game_social_button_page.dart';
import 'game_step_indicator_page.dart';
import 'game_summary_row_page.dart';
import 'game_tab_bar_page.dart';
import 'game_tap_scale_page.dart';
import 'game_text_effects_page.dart';
import 'game_tile_button_page.dart';
import 'game_text_styles_page.dart';
import 'game_timeline_page.dart';
import 'game_tooltip_page.dart';
import 'game_true_false_button_page.dart';
import 'game_ui_strings_page.dart';
import 'game_validators_page.dart';

void main() {
  runApp(const GameUiExampleApp());
}

class GameUiExampleApp extends StatelessWidget {
  const GameUiExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'game_ui example',
      scrollBehavior: _AppScrollBehavior(),
      home: HomePage(),
    );
  }
}

class _AppScrollBehavior extends MaterialScrollBehavior {
  const _AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}

enum DocExampleCategory {
  all,
  gallery,
  buttons,
  foundation,
  forms,
  layout,
  feedback,
  assets,
}

extension on DocExampleCategory {
  String get filterLabel => switch (this) {
    DocExampleCategory.all => 'All',
    DocExampleCategory.gallery => 'Gallery',
    DocExampleCategory.buttons => 'Buttons',
    DocExampleCategory.foundation => 'Foundation',
    DocExampleCategory.forms => 'Forms',
    DocExampleCategory.layout => 'Layout',
    DocExampleCategory.feedback => 'Feedback',
    DocExampleCategory.assets => 'Assets',
  };
}

class _DocIndexEntry {
  const _DocIndexEntry({
    required this.category,
    required this.title,
    required this.description,
    required this.onOpen,
  });

  final DocExampleCategory category;
  final String title;
  final String description;
  final VoidCallback onOpen;

  String get _searchHaystack =>
      '${title.toLowerCase()} ${description.toLowerCase()}';

  bool matchesSearch(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return _searchHaystack.contains(q);
  }

  bool matchesCategory(DocExampleCategory selected) {
    if (selected == DocExampleCategory.all) return true;
    return category == selected;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  DocExampleCategory _categoryFilter = DocExampleCategory.all;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_DocIndexEntry> _entries(BuildContext context) {
    final nav = Navigator.of(context);
    void open(WidgetBuilder builder) =>
        nav.push<void>(MaterialPageRoute<void>(builder: builder));

    return [
      _DocIndexEntry(
        category: DocExampleCategory.gallery,
        title: 'Gallery (single screen)',
        description:
            'All foundation pieces on one scrollable screen: colors, '
            'typography, tokens, shadows, disabled overlay, tap scale, '
            'i18n strings.',
        onOpen: () => open((_) => const GameGalleryPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.buttons,
        title: 'GameButton',
        description:
            'PNG-asset game-style button driven by GameButtonVariant. '
            'Currently ships the glossy 3D circle variant; future variants '
            '(primary, secondary, warning…) land as the asset library grows.',
        onOpen: () => open((_) => const GameButtonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.buttons,
        title: 'GameNumpad',
        description:
            'Numeric keypad: 1-2-3 / 4-5-6 / 7-8-9 / [C] 0 ⌫. Each key is a '
            'GameNumpadButton (layered face + depth rim), color-coded by '
            'type (blue digits, red delete, orange clear).',
        onOpen: () => open((_) => const GameNumpadPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.buttons,
        title: 'GameTrueFalseButton',
        description:
            'Paired green / red boolean answer buttons with check / cancel '
            'icons. Pass isSelected to draw the active outer ring.',
        onOpen: () => open((_) => const GameTrueFalseButtonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.buttons,
        title: 'GameReturnButton',
        description:
            'Square back button — chevron-left icon on the square variant. '
            'Convenience wrapper for app bars and headers.',
        onOpen: () => open((_) => const GameReturnButtonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.buttons,
        title: 'GameTileButton',
        description:
            'Base glossy plastic tile, drawn entirely in code from a single '
            'color (frame, body→lip gradient, top rim, inset edge, corner '
            'highlight) with an arbitrary child. GameDifficultyButton is a '
            'preset of it.',
        onOpen: () => open((_) => const GameTileButtonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.buttons,
        title: 'GameDifficultyButton',
        description:
            'Glossy rounded-square difficulty tile — easy / medium / hard '
            'code-rendered presets with an image placeholder icon and '
            'soft-shadowed label.',
        onOpen: () => open((_) => const GameDifficultyButtonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.buttons,
        title: 'GameActionButton',
        description:
            'Wide pill-shaped primary action button (label + gloss highlight) '
            'plus GameActionGrid for auto 2 / 3 / 4-item row layouts.',
        onOpen: () => open((_) => const GameActionButtonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.foundation,
        title: 'GameColors',
        description:
            'Brand palette (Vibrant Blue · Sunny Yellow · Grass Green · '
            'Friendly Orange · Purple), semantic aliases, and neutrals.',
        onOpen: () => open((_) => const GameColorsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.foundation,
        title: 'GameTextStyles',
        description:
            'Typography scale (heading1/2, body, bodyBold, buttonLabel) '
            'in bundled Fredoka, with BalooChettan2 for comparison.',
        onOpen: () => open((_) => const GameTextStylesPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.foundation,
        title: 'Design tokens',
        description:
            'GameDesignTokens: spacing, font size, radius, tap target. '
            'GameShadows: card and button drop shadows.',
        onOpen: () => open((_) => const GameDesignTokensPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameTapScale',
        description:
            'Press-down scale animation wrapper with optional long-press '
            'and platform feedback (haptic / click).',
        onOpen: () => open((_) => const GameTapScalePage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameDisabledOverlay',
        description:
            'Wraps a child in Opacity(0.38) when disabled; no rebuild of '
            'the underlying asset.',
        onOpen: () => open((_) => const GameDisabledOverlayPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameEmptyState',
        description:
            'Vertical empty-list placeholder — illustration / title / '
            'message / action button slots for "no data yet" screens.',
        onOpen: () => open((_) => const GameEmptyStatePage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.forms,
        title: 'GameValidators',
        description:
            'FormField validators: required, email, number, '
            'positiveAmount, password, passwordMatch, minLength, combine.',
        onOpen: () => open((_) => const GameValidatorsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameUiStrings (i18n)',
        description:
            'Default English copy + GameUiStringsTheme overrides. Built-in '
            'English and Turkish presets via .en() / .tr() / .forLocale().',
        onOpen: () => open((_) => const GameUiStringsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.foundation,
        title: 'Text effects',
        description:
            'GameStrokedText (Fredoka, numbers/labels) and GameStrokedTitle '
            '(BalooChettan2, hero headlines) — chunky stroke + fill text.',
        onOpen: () => open((_) => const GameTextEffectsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameBlinkingCursor',
        description:
            'Fading text cursor for input position; configurable color, '
            'size, and blink interval.',
        onOpen: () => open((_) => const GameBlinkingCursorPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameFeedbackOverlay',
        description:
            'Bouncy correct / wrong circle overlay for answer feedback. '
            'Inline widget or full-screen via showGameFeedbackOverlay().',
        onOpen: () => open((_) => const GameFeedbackOverlayPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameDialog',
        description:
            'Chunky modal card with title / content / actions slots — use '
            'showGameDialog() or push manually.',
        onOpen: () => open((_) => const GameDialogPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'Indicators',
        description:
            'GameStarRating (earned out of total) and GameStatItem '
            '(icon + value + label) for summary screens.',
        onOpen: () => open((_) => const GameIndicatorsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'Layouts',
        description:
            'GameScaffold (transparent Scaffold over a bundled background '
            'PNG) and GameAppBar (transparent AppBar with stroked title + '
            'GameReturnButton in the leading slot).',
        onOpen: () => open((_) => const GameLayoutsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.forms,
        title: 'GameInputDisplay',
        description:
            'Read-only value field with a blinking cursor — pair with '
            'GameNumpad / GameKeyboard when the typed value lives in parent '
            'state rather than a TextField.',
        onOpen: () => open((_) => const GameInputDisplayPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameContentCard',
        description:
            'Rounded card with thick rim, drop shadow, optional bottom slot, '
            'and an optional mascot floating off the left edge.',
        onOpen: () => open((_) => const GameContentCardPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameResultCard',
        description:
            'End-of-level summary panel — GameStarRating floating on the top '
            'edge, plus optional title, subtitle, badge, and stats slots.',
        onOpen: () => open((_) => const GameResultCardPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameProgressBar',
        description:
            'Pill-shaped progress fill — animated tween, optional label '
            'overlay, customizable colors and height.',
        onOpen: () => open((_) => const GameProgressBarPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GamePageIndicator',
        description:
            'Animated dots that pill on the active index — pair with a '
            'PageView for onboarding / carousel screens.',
        onOpen: () => open((_) => const GamePageIndicatorPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.foundation,
        title: 'Painters',
        description:
            'GameEllipsePainter (solid oval) and GameGlossPainter (single '
            'curved highlight stroke) — primitives for button backgrounds.',
        onOpen: () => open((_) => const GamePaintersPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.forms,
        title: 'GameAvatarItem',
        description:
            'Selectable circular item with glow + check badge — wrap any '
            'child (mascot, icon, image) for avatar / character pickers.',
        onOpen: () => open((_) => const GameAvatarItemPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.assets,
        title: 'Mascots',
        description:
            'Bundled animal characters (bear, elephant, fox, penguin) in 11 '
            'matching poses each. Use GameMascotImage or read MascotAssets '
            'paths directly.',
        onOpen: () => open((_) => const GameMascotsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.assets,
        title: 'Backgrounds',
        description:
            '6 bundled full-screen backgrounds (4 generic + congrats + '
            'stars). GameBackground wraps Scaffold body; BackgroundAssets '
            'exposes path constants.',
        onOpen: () => open((_) => const GameBackgroundsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.assets,
        title: 'Frames',
        description:
            '5 colored decorative frame panels (blue, green, orange, '
            'purple, yellow). GameFrame wraps any child with the bundled '
            'rim PNG behind it.',
        onOpen: () => open((_) => const GameFramesPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.assets,
        title: 'Icons',
        description:
            'Bundled illustrated icon PNGs — game (check, lightbulb, '
            'pencil…), system (gear, lock, shield…), audio, stars/trophies.',
        onOpen: () => open((_) => const GameIconsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameDivider',
        description:
            'Horizontal rule with an optional centered widget (star, icon, '
            'label) between two line halves.',
        onOpen: () => open((_) => const GameDividerPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.forms,
        title: 'GameChip',
        description:
            'Selectable filter chip — pill border, color-driven foreground, '
            'optional leading widget. Pair with Wrap for tag rows.',
        onOpen: () => open((_) => const GameChipPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameTooltip',
        description:
            'Chunky Tooltip wrapper — thick border, soft drop shadow, '
            'game-friendly font.',
        onOpen: () => open((_) => const GameTooltipPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GamePremiumBadge',
        description:
            'Gold gradient PRO / PREMIUM pill — icon + uppercase label, glow '
            'shadow for visibility on light surfaces.',
        onOpen: () => open((_) => const GamePremiumBadgePage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameSnackBar',
        description:
            'Floating toast — info / success / warning / error tints. Use '
            'showGameSnackBar() to push via ScaffoldMessenger.',
        onOpen: () => open((_) => const GameSnackBarPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameBanner',
        description:
            'Page-top info banner — icon + message + optional action + '
            'dismiss. Tinted background driven by the brand color.',
        onOpen: () => open((_) => const GameBannerPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameSummaryRow',
        description:
            'Bordered stats panel — optional title above + Row of widgets '
            '(typically GameStatItem) spread spaceEvenly.',
        onOpen: () => open((_) => const GameSummaryRowPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameBottomSheet',
        description:
            'Modal bottom sheet — rounded top corners, drag handle, title / '
            'child / actions slots. Use showGameBottomSheet() helper.',
        onOpen: () => open((_) => const GameBottomSheetPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameTabBar',
        description:
            'Pill-shape tab bar — active tab morphs into a colored pill, '
            'inactive tabs sit on a muted background.',
        onOpen: () => open((_) => const GameTabBarPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameStepIndicator',
        description:
            '1-2-3 wizard progress — completed steps show a check, the '
            'active one shows its number, upcoming are muted.',
        onOpen: () => open((_) => const GameStepIndicatorPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.layout,
        title: 'GameTimeline',
        description:
            'Vertical event list — left column of dots + connecting line, '
            'right column of free-form content per entry.',
        onOpen: () => open((_) => const GameTimelinePage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.feedback,
        title: 'GameSkeleton',
        description:
            'Shimmer placeholder — animated horizontal gradient sweep '
            'across a rounded rectangle.',
        onOpen: () => open((_) => const GameSkeletonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.forms,
        title: 'GameSocialButton',
        description:
            'Branded auth button — Google / Apple / Facebook / X presets. '
            'Override the label or build your own row.',
        onOpen: () => open((_) => const GameSocialButtonPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.forms,
        title: 'GameKeyboard',
        description:
            'Game-style QWERTY keyboard — chunky keys with depth shadow, '
            'optional space bar, ⌫ for delete.',
        onOpen: () => open((_) => const GameKeyboardPage()),
      ),
    ];
  }

  List<_DocIndexEntry> _filteredEntries(BuildContext context) {
    final q = _searchController.text;
    return _entries(context)
        .where((e) => e.matchesCategory(_categoryFilter) && e.matchesSearch(q))
        .toList();
  }

  InputDecoration _searchDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: DocTheme.caption,
      isDense: true,
      filled: true,
      fillColor: DocTheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: DocTheme.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: DocTheme.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF5A6470), width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      suffixIcon: _searchController.text.isEmpty
          ? null
          : IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.close, size: 20),
              color: const Color(0xFF5A6470),
              onPressed: () {
                _searchController.clear();
                setState(() {});
              },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredEntries(context);

    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('game_ui'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'game_ui',
              subtitle: 'Example app',
              body:
                  'Each foundation piece has a doc page with API notes and '
                  'live samples. The gallery shows everything on one screen.',
            ),
            const SizedBox(height: 28),
            Text('Components', style: DocTheme.sectionTitle),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              style: DocTheme.body,
              decoration: _searchDecoration('Search by title or description…'),
            ),
            const SizedBox(height: 12),
            Text('Category', style: DocTheme.caption.copyWith(fontSize: 12)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: Text(DocExampleCategory.all.filterLabel),
                  selected: _categoryFilter == DocExampleCategory.all,
                  onSelected: (_) {
                    setState(() => _categoryFilter = DocExampleCategory.all);
                  },
                ),
                ...DocExampleCategory.values
                    .where((c) => c != DocExampleCategory.all)
                    .map((c) {
                      return FilterChip(
                        label: Text(c.filterLabel),
                        selected: _categoryFilter == c,
                        onSelected: (selected) {
                          setState(() {
                            _categoryFilter = selected
                                ? c
                                : DocExampleCategory.all;
                          });
                        },
                      );
                    }),
              ],
            ),
            const SizedBox(height: 16),
            if (filtered.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'No components match your search or filter.',
                  style: DocTheme.body,
                ),
              )
            else
              ...filtered.expand(
                (e) => [
                  _DocIndexCard(
                    title: e.title,
                    description: e.description,
                    onOpen: e.onOpen,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _DocIndexCard extends StatelessWidget {
  const _DocIndexCard({
    required this.title,
    required this.description,
    required this.onOpen,
  });

  final String title;
  final String description;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DocTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DocTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: DocTheme.sectionTitle),
          const SizedBox(height: 8),
          Text(description, style: DocTheme.body),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onOpen,
              child: const Text('OPEN DOC PAGE'),
            ),
          ),
        ],
      ),
    );
  }
}
