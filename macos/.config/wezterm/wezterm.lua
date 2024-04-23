local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.initial_rows = 999
config.initial_cols = 999

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 20

return config
