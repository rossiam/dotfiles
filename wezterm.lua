local wezterm = require 'wezterm'

local config = wezterm.config_builder()


config.initial_cols = 120
config.initial_rows = 30

config.font_size = 14

config.color_scheme = 'AdventureTime'

config.keys = {
		{
			key = 'k',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.Multiple {
				wezterm.action.ClearScrollback 'ScrollbackAndViewport',
				wezterm.action.SendKey { key = 'l', mods = 'CTRL' },
		},
	},
}

return config
