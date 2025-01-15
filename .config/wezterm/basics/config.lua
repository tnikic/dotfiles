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

	-- Make it full screen
  local mux = wezterm.mux

  wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window{}
    window:gui_window():maximize()
  end)

end

return module
