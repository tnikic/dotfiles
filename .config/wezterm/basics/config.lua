local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- Tmux
	config.default_prog = {
		"/bin/zsh",
		"-l",
		"-c",
		"/opt/homebrew/bin/tmux attach || /opt/homebrew/bin/tmux",
	}

	-- Font
	config.color_scheme = "Tokyo Night Storm"
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

	-- Make it full screen
	config.initial_rows = 999
	config.initial_cols = 999
end

return module
