import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameUiStringsTheme] examples.
class GameUiStringsPage extends StatefulWidget {
  const GameUiStringsPage({super.key});

  @override
  State<GameUiStringsPage> createState() => _GameUiStringsPageState();
}

class _GameUiStringsPageState extends State<GameUiStringsPage> {
  Locale _locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    final preset = GameUiStringsTheme.forLocale(_locale);
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('GameUiStrings'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'GameUiStrings',
              subtitle: 'Defaults + GameUiStringsTheme overrides',
              body:
                  'Default English copy lives in `kGame*` constants. '
                  'GameUiStringsTheme is a ThemeExtension that overrides any '
                  'subset; `context.gameUiStrings` resolves the active value. '
                  'Built-in presets: .en(), .tr(), .forLocale().',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'Locale switcher',
              description:
                  'Toggling rebuilds the subtree below with a different '
                  'GameUiStringsTheme registered in ThemeData.extensions.',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SegmentedButton<Locale>(
                    segments: const [
                      ButtonSegment(
                        value: Locale('en'),
                        label: Text('English'),
                      ),
                      ButtonSegment(value: Locale('tr'), label: Text('Türkçe')),
                    ],
                    selected: {_locale},
                    onSelectionChanged: (set) =>
                        setState(() => _locale = set.first),
                  ),
                  const SizedBox(height: 16),
                  Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(extensions: <ThemeExtension<dynamic>>[preset]),
                    child: Builder(
                      builder: (innerContext) {
                        final s = innerContext.gameUiStrings;
                        final rows = <(String, String)>[
                          ('dialogOk', s.dialogOk),
                          ('dialogCancel', s.dialogCancel),
                          ('searchDefaultHint', s.searchDefaultHint),
                          ('passwordShowTooltip', s.passwordShowTooltip),
                          ('passwordHideTooltip', s.passwordHideTooltip),
                          ('semanticLoading', s.semanticLoading),
                        ];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: rows.map(_row).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'No override (package defaults)',
              description:
                  'Without a registered GameUiStringsTheme, '
                  '`context.gameUiStrings` falls back to the `kGame*` '
                  'English constants.',
              child: _DefaultsRow(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'MaterialApp(\n'
              '  theme: ThemeData(\n'
              '    extensions: [GameUiStringsTheme.tr()],\n'
              '  ),\n'
              ')\n'
              '\n'
              "Text(context.gameUiStrings.dialogOk) // 'Tamam'",
            ),
          ],
        ),
      ),
    );
  }

  Widget _row((String, String) entry) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: RichText(
      text: TextSpan(
        style: DocTheme.body,
        children: [
          TextSpan(text: '${entry.$1}: ', style: DocTheme.caption),
          TextSpan(
            text: entry.$2,
            style: DocTheme.body.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

class _DefaultsRow extends StatelessWidget {
  const _DefaultsRow();

  @override
  Widget build(BuildContext context) {
    final s = context.gameUiStrings;
    final rows = <(String, String)>[
      ('dialogOk', s.dialogOk),
      ('dialogCancel', s.dialogCancel),
      ('searchDefaultHint', s.searchDefaultHint),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: RichText(
                text: TextSpan(
                  style: DocTheme.body,
                  children: [
                    TextSpan(text: '${e.$1}: ', style: DocTheme.caption),
                    TextSpan(
                      text: e.$2,
                      style: DocTheme.body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
