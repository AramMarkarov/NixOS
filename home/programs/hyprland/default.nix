{ config, pkgs, ... }:

let
  # Define the Hyprland configuration as a string, with necessary Nix formatting
  hyprlandConfig = ''
    input {
            kb_layout = us
            kb_variant =
            kb_model =
            kb_options =
            kb_rules =
            sensitivity = 0
            accel_profile = flat
            follow_mouse = 1
        }

        general {
            gaps_in = 8
            gaps_out = 15
            border_size = 5
            col.active_border = 0xfff5c2e7
            col.inactive_border = 0xff45475a
            apply_sens_to_raw = 0
        }

        decoration {
            drop_shadow = true
            shadow_range = 100
            shadow_render_power = 5
            col.shadow = 0x33000000
            col.shadow_inactive = 0x22000000
            rounding = 15
        }

        animations {
            enabled = 1
            bezier = overshot,0.13,0.99,0.29,1.1
            animation = windows,1,4,overshot,slide
            animation = border,1,10,default
            animation = fade,1,10,default
            animation = workspaces,1,6,overshot,slidevert
        }

        dwindle {
            pseudotile = 1
            force_split = 0
            preserve_split = true
        }

        gestures {
            workspace_swipe = yes
            workspace_swipe_fingers = 4
        }

        # Keybinds
        bindm = SUPER,mouse:272,movewindow
        bindm = SUPER,mouse:273,resizewindow

        bind = SUPER,RETURN,exec,alacritty
        bind = SUPER,Q,killactive
        bind = SUPER,M,exit
        bind = SUPER,E,exec,dolphin
        bind = SUPER,S,togglefloating
        bind = SUPER,space,exec,wofi --show drun -o DP-3
        bind = SUPER,P,pseudo

        bind = SUPER,L,exec,~/.config/hypr/scripts/lock
        bind = SUPER,left,movefocus,l
        bind = SUPER,right,movefocus,r
        bind = SUPER,up,movefocus,u
        bind = SUPER,down,movefocus,d

        bind = SUPER,1,workspace,1
        bind = SUPER,2,workspace,2
        bind = SUPER,3,workspace,3
        bind = SUPER,4,workspace,4
        bind = SUPER,5,workspace,5
        bind = SUPER,6,workspace,6
        bind = SUPER,7,workspace,7
        bind = SUPER,8,workspace,8
        bind = SUPER,9,workspace,9
        bind = SUPER,0,workspace,10
        bind = ALT,1,movetoworkspace,1
        bind = ALT,2,movetoworkspace,2
        bind = ALT,3,movetoworkspace,3
        bind = ALT,4,movetoworkspace,4
        bind = ALT,5,movetoworkspace,5
        bind = ALT,6,movetoworkspace,6
        bind = ALT,7,movetoworkspace,7
        bind = ALT,8,movetoworkspace,8
        bind = ALT,9,movetoworkspace,9
        bind = ALT,0,movetoworkspace,10
        bind = SUPER,mouse_down,workspace,e+1
        bind = SUPER,mouse_up,workspace,e-1
        bind = SUPER,g,togglegroup
        bind = SUPER,tab,changegroupactive

        # Manual bindings
        bind = ALT,TAB,cyclenext
        bind = SUPER,F,fullscreen
        bind = SUPER,D,exec,wofi --show drun
        bind = $shiftMod, PRINT, exec, hyprshot -m region
        bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        # Input options for function keys
        input {
            kb_options = fkeys:basic_13-24
        }

        # Requires playerctl for media controls
        bindl = , XF86AudioPlay, exec, playerctl play-pause
        bindl = , XF86AudioPrev, exec, playerctl previous
        bindl = , XF86AudioNext, exec, playerctl next

        # Screenshot bind
        bind = , PRINT, exec, hyprshot -m region

        # Monitor setup (adjust as needed)
        monitor = DP-1, 2560x1600@60, 1, bitdepth, 10

        # Exec-once for startup programs
        exec-once = arrpc
        exec-once = teams-for-linux
        exec-once = vesktop
        exec-once = spotify
        exec-once = steam
        exec-once = $HOME/.config/hypr/autostart
        exec-once = swww-daemon
        exec-once = fcitx5
        exec-once = waybar
        exec-once = dunst
        env = XDG_MENU_PREFIX,plasma-

  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = hyprlandConfig;
  };
}
