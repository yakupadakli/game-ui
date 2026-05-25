import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'doc_widgets.dart';
import 'game_blinking_cursor_page.dart';
import 'game_button_page.dart';
import 'game_colors_page.dart';
import 'game_feedback_overlay_page.dart';
import 'game_indicators_page.dart';
import 'game_painters_page.dart';
import 'game_text_effects_page.dart';
import 'game_design_tokens_page.dart';
import 'game_disabled_overlay_page.dart';
import 'game_gallery_page.dart';
import 'game_tap_scale_page.dart';
import 'game_text_styles_page.dart';
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
        category: DocExampleCategory.layout,
        title: 'Indicators',
        description:
            'GameStarRating (earned out of total) and GameStatItem '
            '(icon + value + label) for summary screens.',
        onOpen: () => open((_) => const GameIndicatorsPage()),
      ),
      _DocIndexEntry(
        category: DocExampleCategory.foundation,
        title: 'Painters',
        description:
            'GameEllipsePainter (solid oval) and GameGlossPainter (single '
            'curved highlight stroke) — primitives for button backgrounds.',
        onOpen: () => open((_) => const GamePaintersPage()),
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
