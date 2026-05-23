# game_ui

Game-style UI widgets for Flutter — buttons, panels, HUD elements, banners, dialogs, and more, rendered with bundled PNG frame assets for an authentic game-art feel.

## Status

**Scaffold only.** Art assets and widget implementations land incrementally.

## Installation

Local path:

```yaml
dependencies:
  game_ui:
    path: ../game_ui
```

## Architecture

Each widget renders a PNG frame asset behind its content via `GamePackageImage.asset`. See `CLAUDE.md` for full architectural notes.

## License

MIT — see [LICENSE](./LICENSE).
