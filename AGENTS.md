# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Project Overview

**game_ui** is a Flutter package providing game-style UI widgets. Every widget uses PNG frame assets (panels, HUD pieces, decorative borders) layered behind content to achieve a game-art aesthetic. There are no code generation steps — all widgets are manually authored.

## Commands

```bash
# Install dependencies
flutter pub get

# Run all tests
flutter test

# Run a single test file
flutter test test/<file>_test.dart

# Run tests with coverage
flutter test --coverage

# Check formatting (CI uses this exact command)
dart format --output=none --set-exit-if-changed .

# Fix formatting
dart format .

# Static analysis
flutter analyze

# API docs — run locally to catch broken doc references (not a CI gate)
dart doc --validate-links

# Run the example gallery app
cd example && flutter run
```

Tests are **widget/unit tests** (`flutter_test`) — there are no golden tests, so don't add `matchesGoldenFile` or `--update-goldens` workflows.

CI uses **Flutter 3.41.4** (stable channel) and runs format → `flutter analyze` → `flutter test --coverage` on Ubuntu, macOS, and Windows.

## Architecture

### Asset-Driven Widget Pattern

The core design pattern: asset-backed widgets render a **PNG frame asset** behind their content (via a `Stack`, or a `DecorationImage`) using `GameUiImage.asset` (`lib/src/core/game_ui_image.dart` — wraps `Image.asset` with `gameUiPackageName`). Assets live in `assets/images/<widget-type>/` and are referenced via `*_assets.dart` files. Many widgets are pure-code (gradients, `BoxDecoration`, `CustomPainter`) and use no PNG at all.

When adding a new widget or variant, you must:
1. Add the PNG asset(s) to the appropriate `assets/images/` subdirectory
2. Register the directory in `pubspec.yaml` under `flutter.assets`
3. Create or update the `*_assets.dart` file with asset path constants
4. Use `GameUiImage.asset(path, …)` for bundled images

### Module Organization

Each widget category lives under `lib/src/widgets/<category>/`. Most categories contain only a **main widget** file plus a **barrel file**; the others appear as needed:
- **Main widget** file (e.g., `game_button.dart`) — the `StatelessWidget`/`StatefulWidget`. A category may hold several (e.g. `game_action_button.dart`, `game_numpad_button.dart`).
- **Barrel file** (e.g., `game_buttons.dart`) — re-exports for the public API (always present).
- **`*_assets.dart`** — PNG asset path constants. Only in categories that load bundled PNGs (`backgrounds`, `buttons`, `frames`, `icons`, `mascots`).
- **`*_variant.dart`** / `*_palette.dart` — enums or shared value types when a widget has visual variants (e.g. `game_button_variant.dart`, `game_button_palette.dart`).

**Shared dimensions, fonts, colors are NOT per-widget** — they are centralized in `lib/src/core/`: `game_design_tokens.dart` (spacing/font/radius scales, font families), `game_colors.dart` (palette), `game_text_styles.dart`, `game_gradients.dart`, `game_shadows.dart`, plus reusable building blocks like `game_ui_image.dart`, `game_disabled_overlay.dart`, `game_gloss_surface.dart`, and `game_horizontal_asset_layout.dart` (core), and `game_stroked_text.dart` (under `widgets/text/`). Pull from these instead of hardcoding magic numbers.

Non-widget building blocks live in their own top-level `lib/src/` dirs: `painters/` (`CustomPainter`s), `animations/` (e.g. `game_tap_scale.dart`, `game_blinking_cursor.dart`), and `validators/`.

Complex widgets use Dart `part`/`part of` to split implementation across files while sharing private members.

### Theming & Localized Strings

- **`GameTheme.lightTheme()`** (`core/game_theme.dart`) builds an M3 `ThemeData` seeded from `GameColors.primary`, wired to the bundled font and `GameTextStyles`. Per-widget `ThemeExtension`s are returned by `GameTheme.defaults()` (currently empty — add `GameButtonTheme`/`GameCardTheme`-style extensions here as categories adopt theming).
- **All user-facing strings** (dialog labels, hints, a11y/semantics labels) resolve through `GameUiStringsTheme`, a `ThemeExtension`. Widgets read them via `context.gameUiStrings` (the `GameUiStringsContext` extension), which falls back to the package's `kGame*` English defaults in `core/game_ui_strings.dart` when no override is registered. Ships `.en()`, `.tr()`, and `forLocale()` presets — **deliberately depends on no `intl`/ARB/`gen-l10n`** to stay dependency-free. When adding a widget with any visible/semantic text, add a field here rather than hardcoding the literal.

### Public API

`lib/game_ui.dart` is the single barrel file exporting all public API. Each widget category has its own barrel file. New widgets must be exported through both levels.

### Example Gallery

`example/` is a live doc gallery. Each public widget has a dedicated `example/lib/game_<widget>_page.dart` page. Registering a new one is a **two-step** edit in `example/lib/main.dart`: add the page `import`, then add a `_DocIndexEntry` (with `category`, `title`, `description`, `onOpen`) to the index list. Shared doc scaffolding (`DocPageBody`, `DocIntro`, `DocTheme`, …) lives in `example/lib/doc_widgets.dart`.

## Language Rules

Source code (variable names, functions, comments, tests, commit messages, docs) must be in **English**. Turkish is only used in user-facing localized strings when required.
