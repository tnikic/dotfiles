local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Font
	config.color_scheme = "Catppuccin Macchiato"
	config.font = wezterm.font("JetBrainsMono Nerd Font")
	config.font_size = 20

	-- Window
	config.window_decorations = "RESIZE"
	config.window_close_confirmation = "AlwaysPrompt"
	config.window_padding = {
		left = 20,
		right = 20,
		top = 10,
		bottom = 10,
	}

	-- Large history
	config.scrollback_lines = 3000
end

return module
