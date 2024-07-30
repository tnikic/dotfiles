local wezterm = require("wezterm")
local colorscheme = require("shared.colorscheme")

-- Rounded edges
local TAB_EDGE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick
local TAB_EDGE_RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick

-- Remove .exe on Windows
local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title:gsub("%.exe", "")
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
	local edge_background = colorscheme.bg
	local background = colorscheme.fg_gutter
	local foreground = colorscheme.bg

	if tab.is_active then
		background = colorscheme.red
		foreground = foreground:lighten(0.1)
	elseif hover then
		background = background:lighten(0.2)
		foreground = foreground:darken(0.2)
	end

	local edge_foreground = background

	local title = tab_title(tab)

	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = " " .. TAB_EDGE_LEFT },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = TAB_EDGE_RIGHT .. " " },
	}
end)
