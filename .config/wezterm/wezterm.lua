-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font_size = 18
config.font = wezterm.font('JetBrains Mono', { weight = "DemiBold" })
config.window_background_opacity = 0.95

config.color_scheme = 'tokyonight-storm'

-- and finally, return the configuration to wezterm
return config
