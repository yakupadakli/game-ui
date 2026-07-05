# game_ui

Game-style UI widgets for Flutter — buttons, panels, HUD elements, banners, dialogs, and more, rendered with bundled PNG frame assets (and pure-code gradients/painters) for an authentic game-art feel.

## Features

- **50+ widget categories** — buttons, cards, dialogs, banners, badges, chips, tabs, XP bars, spin wheels, mascots, timelines, and more.
- **Asset-driven aesthetic** — widgets layer PNG frame assets behind their content via `GameUiImage.asset`; many are pure-code (gradients, `BoxDecoration`, `CustomPainter`) with no PNG at all.
- **Centralized design tokens** — spacing, radii, fonts, colors, gradients, and shadows live in `lib/src/core/` so widgets stay visually consistent.
- **Localizable strings** — every user-facing / semantics string resolves through `GameUiStringsTheme` (ships `.en()` and `.tr()` presets), with **no `intl`/ARB dependency**.
- **Zero runtime dependencies** beyond the Flutter SDK.

## Installation

Local path:

```yaml
dependencies:
  game_ui:
    path: ../game_ui
```

## Usage

Import the single public barrel and drop a widget into your tree:

```dart
import 'package:flutter/material.dart';
import 'package:game_ui/game_ui.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: GameTheme.lightTheme(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              GameBadge(label: 'NEW'),
              SizedBox(height: 16),
              GameXpBar(progress: 0.6, width: 200, height: 32),
              SizedBox(height: 16),
              GameStarRating(starCount: 2, maxStars: 3),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Localized strings

Register an override to swap the built-in English defaults (e.g. Turkish):

```dart
MaterialApp(
  theme: GameTheme.lightTheme().copyWith(
    extensions: [GameUiStringsTheme.tr()],
  ),
  home: const Demo(),
);
```

## Widget catalog

Widgets are grouped by category. See the [`example/`](example/) gallery — every widget has a dedicated page — for a live tour.

| Group | Categories |
| --- | --- |
| Buttons & inputs | `buttons`, `icon_buttons`, `inputs`, `keyboard`, `toggles`, `chips` |
| Surfaces | `cards`, `panels`, `frames`, `dialogs`, `bottom_sheets`, `banners`, `backgrounds` |
| Progress & stats | `xp_bars`, `indicators`, `page_indicator`, `steps`, `streaks`, `summary`, `timeline`, `spin_wheel` |
| Feedback & status | `feedback`, `snackbars`, `tooltips`, `labels`, `empty_states`, `skeleton`, `loading` |
| Content & decoration | `avatars`, `mascots`, `characters`, `icons`, `awards`, `treasures`, `currencies`, `premium`, `items`, `decorations`, `dividers`, `flags`, `balloons` |
| Navigation & layout | `tabs`, `layouts`, `level_islands`, `level_platforms`, `operations`, `socials`, `text` |

## Architecture

Each widget renders a PNG frame asset behind its content via `GameUiImage.asset` (a thin wrapper over `Image.asset` bound to the package). Shared dimensions, colors, and fonts are centralized in `lib/src/core/`. See [`CLAUDE.md`](CLAUDE.md) for full architectural notes.

## Development

```bash
flutter pub get                                        # install deps
flutter test --coverage                                # run tests
flutter analyze                                        # static analysis
dart format --output=none --set-exit-if-changed .      # check formatting
cd example && flutter run                              # run the gallery
```

## License

MIT — see [LICENSE](https://github.com/yakupadakli/game-ui/blob/main/LICENSE).
