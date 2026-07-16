# hyprmods

Install manager for your Hyprland projects.

| Switch | Meaning |
|--------|---------|
| **ON (wired)** | Binds, boot hooks, plugins active |
| **OFF (unwired)** | Hotkeys inert — practically uninstalled |
| **Missing** | Not on disk → **Install from GitHub** (or flip ON to auto-clone) |

## One-liner (fresh machine)

```bash
gh repo clone rippelz/hyprmods ~/code/hyprmods   # or git clone
cd ~/code/hyprmods && ./install.sh
hyprmods migrate
hyprmods install-all     # clones winbar, infiniscroll, bits, …
hyprmods                 # GUI
```

Needs `gh` auth for **private** repos (or SSH git remotes).

## Projects → GitHub

| id | Repo |
|----|------|
| winbar | [rippelz/winbar](https://github.com/rippelz/winbar) |
| infiniscroll | [rippelz/infiniscroll](https://github.com/rippelz/infiniscroll) |
| hypr-nominsize | [rippelz/hypr-nominsize](https://github.com/rippelz/hypr-nominsize) |
| hypr-minimize | built with winbar |
| autoclicker | [rippelz/autoclicker](https://github.com/rippelz/autoclicker) |
| wallpaper-boot, opaque, app-recency, rgb, obs-replay | [rippelz/hypr-bits](https://github.com/rippelz/hypr-bits) |
| theme | local only (`~/.config/themes`) |

Clones land in `~/.local/src/hyprmods/<repo>/` when not already installed.

## CLI

```bash
hyprmods list
hyprmods install winbar
hyprmods install-all
hyprmods off infiniscroll
hyprmods on infiniscroll    # wires (and installs from GH if missing)
hyprmods migrate
```

**Super+Y** — GUI · **Super+Shift+Y** — rofi menu

## License

Private / personal.
