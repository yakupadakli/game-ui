# game_ui

Game-style UI widgets for Flutter — buttons, cards, panels, dialogs, HUD
elements, banners, mascots, level maps, and more, with a playful game-art look.

Widgets are a mix of **bundled PNG frame assets** (panels, mascots, badges,
level islands) and **pure-code surfaces** (gradients, `BoxDecoration`,
`CustomPainter`) — no code generation, and no third-party runtime dependencies.

## Installation

Local path:

```yaml
dependencies:
  game_ui:
    path: ../game_ui
```

Requires Flutter `>=3.41.0` / Dart SDK `^3.11.1`.

## Usage

```dart
import 'package:game_ui/game_ui.dart';

// A code-rendered glossy framed button.
GameFramedButton.text('Play', onTap: handlePress);

// A bundled illustration (tap to make it interactive).
GameTreasureImage(treasure: GameTreasure.chest, size: 96, onTap: openChest);

// Apply the bundled theme + fonts.
MaterialApp(theme: GameTheme.lightTheme(), home: const HomePage());
```

Every public widget is exported from the single `package:game_ui/game_ui.dart`
barrel.

## Architecture

- **Asset-backed widgets** load their PNGs through `GameUiImage.asset`, which
  scopes `Image.asset` to the package bundle. The shared `GameAssetImage`
  building block wraps this with sizing, an optional overlay, and tap handling.
- **Interactive surfaces** share `GamePressable` for a consistent disabled look,
  press-scale, and `button` semantics.
- **Design tokens** (spacing, colors, text styles, gradients, shadows) live in
  `lib/src/core/` — pull from them instead of hardcoding values.
- **User-facing strings** resolve through `GameUiStringsTheme` (a
  `ThemeExtension`), keeping the package dependency-free of `intl`/ARB.

See `CLAUDE.md` for the full architectural notes and conventions.

## Example gallery

`example/` is a live gallery with a dedicated page per widget:

```bash
cd example && flutter run
```

## Development

```bash
flutter pub get
flutter test
flutter analyze
dart format .
```

## License

MIT — see [LICENSE](https://github.com/yakupadakli/game-ui/blob/main/LICENSE).
