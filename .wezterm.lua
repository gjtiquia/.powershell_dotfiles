-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.default_prog = { "pwsh.exe", "-NoLogo" }

-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("FiraMono Nerd Font Mono")

config.color_scheme = "rose-pine-dawn"

local all_schemes = wezterm.color.get_builtin_schemes()
local my_theme = all_schemes["rose-pine-dawn"]
config.colors = {
	tab_bar = {
		-- Set a single background color for the entire tab bar
		background = my_theme.background,

		active_tab = {
			bg_color = my_theme.background, -- white
			-- fg_color = my_theme.foreground, -- dark gray
			-- fg_color = my_theme.ansi[2], -- pink,
			-- fg_color = my_theme.ansi[3], -- blue,
			-- fg_color = my_theme.ansi[4], -- yellow
			-- fg_color = my_theme.ansi[5], -- dark blue,
			-- fg_color = my_theme.ansi[6], -- purple,
			fg_color = my_theme.ansi[7], -- light pink,
			-- fg_color = my_theme.ansi[8], -- dark purple,
		},

		inactive_tab = {
			bg_color = my_theme.background,
			fg_color = my_theme.ansi[6],
		},

		inactive_tab_hover = {
			bg_color = my_theme.background,
			fg_color = my_theme.ansi[4],
		},

		new_tab = {
			bg_color = my_theme.background,
			fg_color = my_theme.ansi[6],
		},

		new_tab_hover = {
			bg_color = my_theme.background,
			fg_color = my_theme.ansi[4],
		},
	},
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.window_frame = {
	-- Set the active (focused) frame background
	active_titlebar_bg = my_theme.background,
	-- Set the inactive (unfocused) frame background
	inactive_titlebar_bg = my_theme.background,
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config

-- keybinding notes:
--
-- tabs
-- ctrl shift t = new tab
-- ctrl shift w = close tab
-- ctrl shift 1/2/3 = go to tab 1/2/3
