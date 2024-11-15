{ config, pkgs, ... }:
{
imports = [

    ./hypr-env.nix


];

let
  hyprlandConfig = {
    input = {
      kb_layout = "us";  # Replace with your actual layout
      kb_variant = "ffffff";
      kb_model = "pc105";
      kb_options = "ctrl:nocaps";
      kb_rules = "evdev";

      follow_mouse = true;

      touchpad = {
        natural_scroll = "no";
      };
    };

    general = {
      sensitivity = 1.0;
      gaps_in = 8;
      gaps_out = 15;
      border_size = 5;
      col.active_border = "0xfff5c2e7";
      col.inactive_border = "0xff45475a";
      apply_sens_to_raw = 0;
    };

    decoration = {
      drop_shadow = true;
      shadow_range = 100;
      shadow_render_power = 5;
      col.shadow = "0x33000000";
      col.shadow_inactive = "0x22000000";
      rounding = 15;
    };

    animations = {
      enabled = true;
      bezier = "overshot,0.13,0.99,0.29,1.1";
      animation = [
        "windows,1,4,overshot,slide"
        "border,1,10,default"
        "fade,1,10,default"
        "workspaces,1,6,overshot,slidevert"
      ];
    };

    gestures = {
      workspace_swipe = "yes";
      workspace_swipe_fingers = 4;
    };

    # Keybindings (simplified)
    binds = {
      "SUPER,RETURN" = "exec,alacritty";
      "SUPER,Q" = "killactive";
      "SUPER,M" = "exit";
      "SUPER,E" = "exec,dolphin";
      "SUPER,S" = "togglefloating";
      "SUPER,space" = "exec,wofi --show drun -o DP-3";
      "SUPER,P" = "pseudo";
      "SUPER,L" = "exec,~/.config/hypr/scripts/lock";
      "SUPER,left" = "movefocus,l";
      "SUPER,right" = "movefocus,r";
      "SUPER,up" = "movefocus,u";
      "SUPER,down" = "movefocus,d";
      # Add more binds as needed
    };

    # Monitor configuration
    monitor = [
      "DP-2,3840x2160@60,0x0,1,bitdepth,10"
      "DP-1,2560x1440@165,3840x0,1,bitdepth,10"
    ];

    execOnce = [
      "arrpc"
      "dunst"
      "agsv1"
      "teams-for-linux"
      "vesktop"
      "spotify"
      "steam"
      "$HOME/.config/hypr/autostart"
      "hyprpaper"
      "fcitx5"
    ];
  };

in {
  # Include hyprland settings in NixOS or Home Manager module
  environment.systemPackages = with pkgs; [
    hyprland
  ];

  # Apply custom Hyprland configuration
  programs.hyprland = {
    enable = true;
    configFile = pkgs.writeText "hyprland.conf" ''
      input {
        kb_layout = "${hyprlandConfig.input.kb_layout}";
        kb_variant = "${hyprlandConfig.input.kb_variant}";
        kb_model = "${hyprlandConfig.input.kb_model}";
        kb_options = "${hyprlandConfig.input.kb_options}";
        kb_rules = "${hyprlandConfig.input.kb_rules}";

        follow_mouse = ${toString hyprlandConfig.input.follow_mouse};

        touchpad {
          natural_scroll = "${hyprlandConfig.input.touchpad.natural_scroll}";
        }
      }

      general {
        sensitivity = ${hyprlandConfig.general.sensitivity};
        gaps_in = ${hyprlandConfig.general.gaps_in};
        gaps_out = ${hyprlandConfig.general.gaps_out};
        border_size = ${hyprlandConfig.general.border_size};
        col.active_border = "${hyprlandConfig.general.col.active_border}";
        col.inactive_border = "${hyprlandConfig.general.col.inactive_border}";
        apply_sens_to_raw = ${toString hyprlandConfig.general.apply_sens_to_raw};
      }

      decoration {
        drop_shadow = ${toString hyprlandConfig.decoration.drop_shadow};
        shadow_range = ${hyprlandConfig.decoration.shadow_range};
        shadow_render_power = ${hyprlandConfig.decoration.shadow_render_power};
        col.shadow = "${hyprlandConfig.decoration.col.shadow}";
        col.shadow_inactive = "${hyprlandConfig.decoration.col.shadow_inactive}";
        rounding = ${hyprlandConfig.decoration.rounding};
      }

      animations {
        enabled = ${toString hyprlandConfig.animations.enabled};
        bezier = "${hyprlandConfig.animations.bezier}";
        animation = ${lib.concatStringsSep " " hyprlandConfig.animations.animation};
      }

      windowrule = ${lib.concatStringsSep " " hyprlandConfig.windowrule};

      gestures {
        workspace_swipe = "${hyprlandConfig.gestures.workspace_swipe}";
        workspace_swipe_fingers = ${toString hyprlandConfig.gestures.workspace_swipe_fingers};
      }

      binds {
        ${lib.concatStringsSep "\n" (map (bind: "bind=${bind}") (attrValues hyprlandConfig.binds))}
      }

      monitor = ${lib.concatStringsSep " " hyprlandConfig.monitor};

      exec-once = ${lib.concatStringsSep " " hyprlandConfig.execOnce};
    '';
        };
    }
}