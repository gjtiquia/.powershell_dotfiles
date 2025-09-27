-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.default_prog = { "pwsh.exe", "-NoLogo" }

-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("FiraMono Nerd Font Mono")

config.color_scheme = "rose-pine-dawn"

-- Finally, return the configuration to wezterm:
return config
