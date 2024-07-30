local wezterm = require("wezterm")
local colorscheme = require("shared.colorscheme")

wezterm.on("update-right-status", function(window, _)
	local workspace = window:active_workspace()

	local main_color = colorscheme.yellow
	if window:leader_is_active() then
		main_color = colorscheme.purple
	end

	window:set_right_status(wezterm.format({
		{ Background = { Color = colorscheme.bg } },
		{ Foreground = { Color = main_color } },
		{ Text = "" },
		{ Background = { Color = main_color } },
		{ Foreground = { Color = colorscheme.bg } },
		{ Text = "  " .. workspace .. "  " },
	}))
end)
