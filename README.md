# hyprmods

Install manager for your Hyprland projects.

| Switch | Meaning |
|--------|---------|
| **ON (wired)** | Binds, boot hooks, plugins active |
| **OFF (unwired)** | Hotkeys inert — practically uninstalled |
| **Missing** | Not on disk → **Install from GitHub** (or flip ON to auto-clone) |

## One-liner (fresh machine / other laptop)

```bash
gh repo clone rippelz/hyprmods ~/code/hyprmods   # or git clone
cd ~/code/hyprmods && ./install.sh
hyprmods migrate          # append-only wire (lua or conf) — never overwrites
hyprmods install-all      # clones winbar, infiniscroll, bits, …
hyprmods on infiniscroll  # enable canvas mode wiring
hyprmods doctor           # verify this machine (input group, deps, …)
hyprmods                  # GUI
```

Needs `gh` auth for **private** repos (or SSH git remotes).

### What `migrate` does (and does *not*)

- Detects primary config: **`hyprland.lua` wins** if present (Hyprland 0.55+), else `hyprland.conf`
- **Appends** a small hyprmods block if missing
- Writes a **one-time backup** (`*.pre-hyprmods`) before the first edit
- **Never** replaces or regenerates your full Hyprland config
- `hyprmods show-snippet` prints the exact lines without editing

## Projects → GitHub

| id | Repo |
|----|------|
| hyprmods | [rippelz/hyprmods](https://github.com/rippelz/hyprmods) (this tool) |
| winbar | [rippelz/winbar](https://github.com/rippelz/winbar) |
| infiniscroll | [rippelz/infiniscroll](https://github.com/rippelz/infiniscroll) |
| hypr-nominsize | [rippelz/hypr-nominsize](https://github.com/rippelz/hypr-nominsize) |
| hypr-minimize | built with winbar |
| autoclicker | [rippelz/autoclicker](https://github.com/rippelz/autoclicker) |
| wallpaper-boot, opaque, app-recency, rgb, obs-replay | [rippelz/hypr-bits](https://github.com/rippelz/hypr-bits) |
| theme | [rippelz/themes](https://github.com/rippelz/themes) |

Clones land in `~/.local/src/hyprmods/<repo>/` when not already installed.

## CLI

```bash
hyprmods list
hyprmods doctor            # machine readiness (input group, wiring, deps)
hyprmods show-snippet      # lua/conf lines to append (no file edits)
hyprmods install winbar
hyprmods install-all
hyprmods outdated          # projects with a newer GitHub tip
hyprmods update winbar     # pull + re-run install.sh
hyprmods update-all
hyprmods off infiniscroll
hyprmods on infiniscroll   # wires (and installs from GH if missing)
hyprmods migrate           # append-only wire into hyprland.lua or .conf
```

`list` / the GUI check each project’s local git clone against GitHub (via `gh` when available). Cached for 5 minutes (`HYPRMODS_UPDATE_TTL`).

**Super+Y** — GUI · **Super+Shift+Y** — rofi menu

## Infiniscroll on a second laptop

Most “it doesn’t work well” cases are environment, not the canvas code:

1. **`input` group** — Super+scroll zoom reads `/dev/input` via evdev. Without the group, pan works but zoom is dead.
2. **Wiring** — if you only use `hyprland.lua`, old `source = hyprmods.conf` in `.conf` is ignored. Run `hyprmods migrate`.
3. **PATH** — `~/.local/bin` must be on PATH so binds find the binaries.
4. **Boot resume** — mode state survives reboot; zoomd does not. `infiniscroll-boot` via `exec-once` (hyprmods wires this).

```bash
hyprmods doctor
# fix any ✗ lines, then:
hyprmods on infiniscroll
# Super+I → Super+Space pan → Super+scroll zoom
```

## License

Private / personal.
