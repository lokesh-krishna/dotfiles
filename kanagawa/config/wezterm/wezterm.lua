-- Pull in the wezterm API and helper files
local wezterm = require 'wezterm'
-- table to hold the configuration
local config = {}

-- use config_builder for clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.term = 'wezterm'

-- colors
config.color_scheme = 'Kanagawa'

-- leave inactive panes alone
config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 1.0
}

-- fonts
config.font_size = 13.0
config.font = wezterm.font('Operator Mono SSm', { weight = 325, style = "Normal" })
config.font_rules = {
  -- bold without italic
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font('Operator Mono SSm', { weight = "Regular", style = "Normal"})
  },
  -- bold and italic
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font('Operator Mono SSm', { weight = "Regular", style = "Italic"})
  },
  -- normal and italic
  {
    intensity = 'Normal',
    italic = true,
    font = wezterm.font('Operator Mono SSm', { weight = 325, style = "Italic" })
  }
}
config.harfbuzz_features = { 'ss03=1' }

-- padding
config.window_padding = {
  left = "15px",
  right = "15px",
  bottom = "15px",
  top = "15px",
}

-- retro tab bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.colors = {
  tab_bar = {
    background = '#2a2a37',
    active_tab = {
      bg_color = '#54546d',
      fg_color = '#dcd7ba',
      italic = true,
    },
    inactive_tab = {
      bg_color = '#363646',
      fg_color = '#727169'
    },
    new_tab = {
      bg_color = '#363646',
      fg_color = '#717c7c'
    }
  }
}

-- return the configuration to wezterm
return config
