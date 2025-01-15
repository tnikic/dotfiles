local wezterm = require("wezterm")
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Macchiato"]

wezterm.on("update-right-status", function(window, _)
	local workspace = window:active_workspace()

	local main_color = wezterm.color.parse(custom.brights[4])
	if window:leader_is_active() then
		main_color = wezterm.color.parse(custom.ansi[6])
	end

	window:set_right_status(wezterm.format({
		{ Background = { Color = wezterm.color.parse(custom.background) } },
		{ Foreground = { Color = main_color } },
		{ Text = "" },
		{ Background = { Color = main_color } },
		{ Foreground = { Color = wezterm.color.parse(custom.background) } },
		{ Text = "  " .. workspace .. "  " },
	}))
end)
