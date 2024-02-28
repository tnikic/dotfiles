local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 20

return config
