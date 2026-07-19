-- After `hyprmods migrate`, base hyprland.lua only needs this APPEND
-- (hyprmods migrate does this for you — it never replaces your full config):

-- >>> hyprmods managed (do not edit) >>>
-- Project installs managed by ~/.local/bin/hyprmods
-- Toggle install/uninstall with: hyprmods  |  Super+Y
pcall(require, "hyprmods")
-- <<< hyprmods managed <<<

-- That loads ~/.config/hypr/hyprmods.lua (generated), which bridges the
-- hyprlang snippet ~/.config/hypr/hyprmods.conf so dynamic mode files
-- (infini.conf, mode.conf) still work after Super+I / Super+W toggles.
--
-- Prefer this over editing hyprland.conf: if hyprland.lua exists, Hyprland
-- 0.55+ ignores hyprland.conf entirely.
