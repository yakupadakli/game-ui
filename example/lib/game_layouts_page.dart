import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

import 'doc_widgets.dart';

/// [GameScaffold] and [GameAppBar] examples.
class GameLayoutsPage extends StatelessWidget {
  const GameLayoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DocTheme.background,
      appBar: AppBar(
        title: const Text('Layouts'),
        backgroundColor: DocTheme.appBarBg,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: DocPageBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocIntro(
              title: 'Layouts',
              subtitle: 'GameScaffold · GameAppBar',
              body:
                  'Scaffold wrapper that paints a bundled background PNG '
                  'behind the body, plus a transparent app bar with a chunky '
                  'stroked title and an optional back button.',
            ),
            const SizedBox(height: 24),
            DocSection(
              title: 'GameScaffold + GameAppBar (preview)',
              description:
                  'Tap to open a full-screen example with the default bg3 '
                  'background and a transparent AppBar.',
              child: Center(
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (_) => const _LayoutPreview(
                          title: 'Level 1',
                          asset: BackgroundAssets.bg3,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.launch),
                  label: const Text('Open preview'),
                ),
              ),
            ),
            DocSection(
              title: 'Alt backgrounds',
              description:
                  'Pass any path from BackgroundAssets — congrats / stars '
                  'are popular for win screens.',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _PreviewChip(
                    label: 'bg1',
                    asset: BackgroundAssets.bg1,
                    title: 'Lessons',
                  ),
                  _PreviewChip(
                    label: 'bg2',
                    asset: BackgroundAssets.bg2,
                    title: 'Practice',
                  ),
                  _PreviewChip(
                    label: 'congrats',
                    asset: BackgroundAssets.congrats,
                    title: 'Well done!',
                  ),
                  _PreviewChip(
                    label: 'stars',
                    asset: BackgroundAssets.stars,
                    title: 'Achievements',
                  ),
                ],
              ),
            ),
            const DocSection(
              title: 'GameAppBar only',
              description:
                  'PreferredSizeWidget — drop into a normal Scaffold to get '
                  'the stroked title and back button without the background.',
              child: _AppBarOnly(),
            ),
            const DocCode(
              "import 'package:game_ui/game_ui.dart';\n"
              '\n'
              'GameScaffold(\n'
              '  backgroundAsset: BackgroundAssets.bg3,\n'
              '  appBar: GameAppBar(\n'
              "    title: 'Level 1',\n"
              '    onBack: () => Navigator.pop(context),\n'
              '  ),\n'
              '  body: Center(child: Text(...)),\n'
              ')',
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewChip extends StatelessWidget {
  const _PreviewChip({
    required this.label,
    required this.asset,
    required this.title,
  });

  final String label;
  final String asset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: () {
        Navigator.of(context).push<void>(
          MaterialPageRoute<void>(
            builder: (_) => _LayoutPreview(title: title, asset: asset),
          ),
        );
      },
    );
  }
}

class _LayoutPreview extends StatelessWidget {
  const _LayoutPreview({required this.title, required this.asset});

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      backgroundAsset: asset,
      appBar: GameAppBar(title: title),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'GameScaffold + GameAppBar.\n\n'
            'The background image fills the entire viewport and the app bar '
            'is fully transparent so the art reads through.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}

class _AppBarOnly extends StatelessWidget {
  const _AppBarOnly();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 80,
        child: Container(
          color: const Color(0xFFB7DDF0),
          child: GameAppBar(
            title: 'Settings',
            onBack: () {},
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.tune, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
