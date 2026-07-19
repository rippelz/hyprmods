#!/usr/bin/env bash
# install hyprmods → ~/.local/bin/hyprmods
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
BIN="${XDG_BIN_HOME:-$HOME/.local/bin}"
mkdir -p "$BIN"

install -m 755 "$ROOT/bin/hyprmods" "$BIN/hyprmods"
echo "installed: $BIN/hyprmods"

if python3 - <<'PY' 2>/dev/null
import gi
gi.require_version("Gtk", "4.0")
gi.require_version("Adw", "1")
from gi.repository import Gtk, Adw
print("gtk4+adw ok")
PY
then
  :
else
  echo "note: GTK4 / libadwaita Python bindings missing — CLI still works"
  echo "      (pacman: python-gobject gtk4 libadwaita)"
fi

# PATH hint early (common “works on my desktop, not my laptop” footgun)
case ":${PATH}:" in
  *":$BIN:"*) ;;
  *)
    echo ""
    echo "WARNING: $BIN is not on PATH in this shell."
    echo "  Add to your shell rc:"
    echo '    export PATH="$HOME/.local/bin:$PATH"'
    ;;
esac

echo ""
echo "══════════════════════════════════════════════════════"
echo " NEXT STEPS (fresh machine / other laptop)"
echo "══════════════════════════════════════════════════════"
echo "  1. hyprmods migrate"
echo "       Append-only wire into hyprland.lua (preferred) or hyprland.conf."
echo "       Never overwrites your settings — one-time backup only."
echo "  2. hyprmods install-all"
echo "       Clones missing projects (infiniscroll, winbar, …) + install.sh"
echo "  3. hyprmods on infiniscroll   # (and any others you want)"
echo "  4. Super+scroll needs the input group (once):"
echo "       sudo usermod -aG input \"\$USER\" && re-login"
echo "  5. hyprmods doctor            # verify this machine"
echo "  6. hyprmods                   # GUI · Super+Y after migrate"
echo "══════════════════════════════════════════════════════"
echo ""
echo "Snippets without editing:  hyprmods show-snippet"
echo "Private repos need:        gh auth login"
echo "Docs:                      $ROOT/docs/hyprland-snippet.conf"
echo "                           $ROOT/docs/hyprland-snippet.lua"
