-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.default_prog = { "pwsh.exe", "-NoLogo" }

-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("FiraMono Nerd Font Mono")

-- 1. Get all built-in color schemes
local all_schemes = wezterm.color.get_builtin_schemes()

-- 2. Extract the "rose-pine-dawn" scheme into your local variable
local my_theme = all_schemes["rose-pine-dawn"]

-- 3. Assign the theme to the main color scheme config
config.color_scheme = "rose-pine-dawn"

-- 4. Now, reuse the colors from `my_theme` to style the tab bar.
--    You can reference colors by their standard names.
config.colors = {
	tab_bar = {
		background = my_theme.background,

		active_tab = {
			bg_color = my_theme.ansi[6], -- Using Cyan from the scheme
			fg_color = my_theme.background,
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = my_theme.background,
			fg_color = my_theme.ansi[7], -- Using White/Gray from the scheme
		},

		inactive_tab_hover = {
			bg_color = my_theme.brights[6], -- Using Bright Cyan
			fg_color = my_theme.background,
		},

		new_tab = {
			bg_color = my_theme.background,
			fg_color = my_theme.foreground,
		},

		new_tab_hover = {
			bg_color = my_theme.ansi[2], -- Using Green for the '+' button hover
			fg_color = my_theme.background,
		},
	},
}

config.window_frame = {
	-- Set the active (focused) frame background
	active_titlebar_bg = my_theme.background,
	-- Set the inactive (unfocused) frame background
	inactive_titlebar_bg = my_theme.background,
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- Other optional settings
config.hide_tab_bar_if_only_one_tab = true

-- Finally, return the configuration to wezterm:
return config

-- keybinding notes:
--
-- tabs
-- ctrl shift t = new tab
-- ctrl shift w = close tab
-- ctrl shift 1/2/3 = go to tab 1/2/3
