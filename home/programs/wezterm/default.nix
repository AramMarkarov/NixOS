{ config, pkgs, ... }:

{
  home.file.".wezterm.lua".text = ''
    local wezterm = require 'wezterm'
    local act = wezterm.action
    local config = {
    unix_domains = {
        {
            name = 'unix',
            skip_permissions_check = true,
        },
    },
    default_gui_startup_args = { 'connect', 'unix' },
    font = wezterm.font("0xProto Nerd Font Mono"),
    window_background_opacity = 0.7,
    use_fancy_tab_bar = false,
    cursor_thickness = "1pt",
    default_cursor_style = "SteadyBar",
    window_frame = {
        active_titlebar_bg = "rgba(0,0,0,0.7)",
        border_left_width = '0',
        border_right_width = '0',
        border_bottom_height = '0',
        border_top_height = '0',
    },
    color_scheme = "Rosé Pine Moon (Gogh)",
    colors = {
        tab_bar = {
            background = "rgba(0, 0, 0, 0.7)",
            active_tab = {
                bg_color = "rgba(60,60,60,0.5)",
                fg_color = "rgba(255,255,255,1)",
                italic = false,
            },
            inactive_tab = {
                bg_color = "rgba(0,0,0,0.7)",
                fg_color = "rgba(150,150,150,0.2)"
            },
            inactive_tab_hover = {
                bg_color = "rgba(230,230,230,0.1)",
                fg_color = "rgba(255,255,255,1.0)"
            },
            new_tab = {
                bg_color = "rgba(0,0,0,0.7)",
                fg_color = "rgba(255,255,255,1)"
            },
            new_tab_hover = {
                bg_color = "rgba(230,230,230,0.1)",
                fg_color = "rgba(255,255,255,1.0)",
                italic = false
            },
        },
    },
    keys = {
        { key = 'LeftArrow', mods = 'CTRL|ALT', action = act.ActivateTabRelative(-1) },
        { key = 'RightArrow', mods = 'CTRL|ALT', action = act.ActivateTabRelative(1) },
        { key = '-', mods = 'CTRL|ALT', action = act.CloseCurrentTab { confirm = false }, },
        { key = '=', mods = 'CTRL|ALT', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = '.', mods = 'CTRL|ALT', action = act.SplitHorizontal {domain="CurrentPaneDomain"}, },
        { key = ',', mods = 'CTRL|ALT', action = act.SplitVertical {domain="CurrentPaneDomain"}, },
    },
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
}

return config
  '';
}
