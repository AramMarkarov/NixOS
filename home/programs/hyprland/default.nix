{ config, pkgs, ... }:

let
  hyprlandConfig = ''
    # Rose Pine Colors
    $base	        = 0xff232136
    $surface        = 0xff2a273f
    $overlay        = 0xff393552
    $muted          = 0xff6e6a86
    $subtle         = 0xff908caa
    $text           = 0xffe0def4
    $love           = 0xffeb6f92
    $gold           = 0xfff6c177
    $rose           = 0xffea9a97
    $pine           = 0xff3e8fb0
    $foam           = 0xff9ccfd8
    $iris           = 0xffc4a7e7
    $highlightLow   = 0xff2a283e
    $highlightMed   = 0xff44415a
    $highlightHigh  = 0xff56526e

    input {
            kb_layout = us
            kb_variant =
            kb_model =
            kb_options = fkeys:basic_13-24
            kb_rules =
            sensitivity = 0
            accel_profile = flat
            follow_mouse = 1
        }

    general {
        gaps_in = 8
        gaps_out = 15
        border_size = 3
        col.active_border = $rose $pine $love $iris 90deg
        col.inactive_border = $muted
        }

    decoration {
        rounding = 15
        shadow {
            enabled = true
            range = 25
            render_power = 5
            color = $highlightHigh
            color_inactive = $highlightLow
            }
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

        bind = SUPER,RETURN,exec,wezterm
        bind = SUPER,Q,killactive
        bind = SUPER,M,exit
        bind = SUPER,E,exec,dolphin
        bind = SUPER,S,togglefloating
        bind = SUPER,P,pseudo
        bind = SUPER,O,exec,spotify
        bind = SUPER,B,exec,firefox

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
        bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        bindel = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bindel = , F14, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        bindel = , F15, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bindel = , F17, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%+
        bindel = , F16, exec, wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-

        # Requires playerctl for media controls
        bindl = , XF86AudioPlay, exec, playerctl play-pause
        bindl = , XF86AudioPrev, exec, playerctl previous
        bindl = , XF86AudioNext, exec, playerctl next

        # Screenshot and copy binds
        bind = , PRINT, exec, hyprshot -m region
        bind = SUPER, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy

        # Monitor setup (adjust as needed)
        monitor = DP-1, 2560x1440@165, 2160x0, 1, bitdepth, 10
        monitor = DP-2, 3840x2160@60, 0x0, 1, bitdepth, 10, transform, 1
        

        # Exec-once for startup programs
        exec-once = hyprpanel
        exec-once = arrpc
        exec-once = teams-for-linux
        exec-once = vesktop
        exec-once = spotify
        exec-once = steam
        exec-once = thunderbird
        exec-once = dispwin -d1 /home/aramjonghu/.color/icc/1440p.icm
        exec-once = dispwin -d2 /home/aramjonghu/.color/icc/2160p.icm
        exec-once = fcitx5
        exec-once = wl-paste --type text --watch cliphist store
        exec-once = wl-paste --type image --watch cliphist store

        windowrulev2 = opacity 0.0 override, class:^(xwaylandvideobridge)$
        windowrulev2 = noanim, class:^(xwaylandvideobridge)$
        windowrulev2 = noinitialfocus, class:^(xwaylandvideobridge)$
        windowrulev2 = maxsize 1 1, class:^(xwaylandvideobridge)$
        windowrulev2 = noblur, class:^(xwaylandvideobridge)$
        windowrulev2 = nofocus, class:^(xwaylandvideobridge)$
  '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = pkgs.hyprland;
    xwayland.enable = true;
    extraConfig = hyprlandConfig;
  };
}
