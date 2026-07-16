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

echo
echo "Next:"
echo "  hyprmods migrate       # wire into hyprland.conf (once)"
echo "  hyprmods install-all   # clone missing projects from GitHub"
echo "  hyprmods               # GUI"
echo
echo "Private repos need:  gh auth login"
echo "Super+Y opens the manager after migrate."
