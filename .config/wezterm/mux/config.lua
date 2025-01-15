local wezterm = require("wezterm")
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Macchiato"]

local module = {}

function module.apply_to_config(config)
	-- Enable Tab Bar
	config.enable_tab_bar = true

	-- Styling
	config.window_frame = {
		font = wezterm.font("JetBrainsMono Nerd Font"),
		font_size = 16.0,
		active_titlebar_bg = wezterm.color.parse(custom.background),
		inactive_titlebar_bg = wezterm.color.parse(custom.background)
	}

	-- Using the external bar
	config.use_fancy_tab_bar = true

	-- Additional buttons
	config.show_tab_index_in_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false

	-- Bottom style bar
	config.tab_bar_at_bottom = false
end

return module
