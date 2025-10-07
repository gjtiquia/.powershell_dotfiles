-- keybinding notes:
--
-- tabs
-- ctrl shift t = new tab
-- ctrl shift w = close tab
-- ctrl shift 1/2/3 = go to tab 1/2/3

local wezterm = require("wezterm")
local config = wezterm.config_builder()

--

-- FONT

-- local font_name = "JetBrains Mono"
local font_name = "FiraMono Nerd Font Mono"

-- COLOR THEME

local light_theme_name = "rose-pine-dawn"
local dark_theme_name = "rose-pine-moon"
local theme_name = dark_theme_name -- fallback

--

config.default_prog = { "pwsh.exe", "-NoLogo" }

-- CUSTOM KEYBINDS
-- (replicating tmux default keybinds)

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
	},
	{
		-- Prompt for a name to use for a new workspace and switch to it.
		key = "N",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- FONTS & APPEARANCE

config.font = wezterm.font(font_name)

-- https://wezterm.org/config/lua/wezterm.gui/get_appearance.html

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return dark_theme_name
	else
		return light_theme_name
	end
end

theme_name = scheme_for_appearance(get_appearance())

config.color_scheme = theme_name

local all_schemes = wezterm.color.get_builtin_schemes()
local my_theme = all_schemes[theme_name]
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
config.use_fancy_tab_bar = false

config.window_frame = {
	active_titlebar_bg = my_theme.background,
	inactive_titlebar_bg = my_theme.background,
	font = wezterm.font({
		family = font_name,
	}),
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
