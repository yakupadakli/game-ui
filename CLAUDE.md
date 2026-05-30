# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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

# API docs (CI validates links)
dart doc --validate-links

# Run the example gallery app
cd example && flutter run

# Update golden test images
flutter test --update-goldens
```

CI uses **Flutter 3.41.4** (stable channel).

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

**Shared dimensions, fonts, colors are NOT per-widget** — they are centralized in `lib/src/core/`: `game_design_tokens.dart` (spacing/font/radius scales, font families), `game_colors.dart` (palette), plus reusable building blocks like `game_ui_image.dart` and `game_disabled_overlay.dart` (core), and `game_stroked_text.dart` (under `widgets/text/`). Pull from these instead of hardcoding magic numbers.

Complex widgets use Dart `part`/`part of` to split implementation across files while sharing private members.

### Public API

`lib/game_ui.dart` is the single barrel file exporting all public API. Each widget category has its own barrel file. New widgets must be exported through both levels.

## Language Rules

Source code (variable names, functions, comments, tests, commit messages, docs) must be in **English**. Turkish is only used in user-facing localized strings when required.
