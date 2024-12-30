{ inputs, config, pkgs, ... }:
{
    imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

    programs.hyprpanel = {
        enable = true;
        systemd.enable = true;
        hyprland.enable = true;
        theme = "rose_pine";
        layout = {
            "bar.layouts" = {
                "0" = {
                    left = ["dashboard" "workspaces" "windowtitle"];
                    middle = ["media"];
                    right = ["volume" "network" "bluetooth" "systray" "clock" "notifications"];
                };
                "1" = {
                    left = ["dashboard" "workspaces" "windowtitle"];
                    middle = ["media"];
                    right = ["volume" "clock" "notifications"];
                };
            };

        };
        settings = {
              bar.launcher.autoDetectIcon = true;
              bar.workspaces.show_icons = true;

              menus.clock = {
                time = {
                  military = true;
                  hideSeconds = true;
                };
                weather.unit = "metric";
              };

              menus.dashboard.directories.enabled = false;
              menus.dashboard.stats.enable_gpu = true;

              theme.bar.transparent = true;

              theme.font = {
                name = "CaskaydiaCove NF";
                size = "16px";
              };
        };
    };
}
