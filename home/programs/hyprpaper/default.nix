{ config, pkgs, ... }:

let
  hyprpaperConfig = {
    preload = "/wallpapers/DSC00301.JPG";
    wallpaper = "/wallpapers/DSC00301.JPG";
    splash = false;
  };

in {
  # Hyprland settings and other configurations...

  # Hyprpaper configuration
  programs.hyprpaper = {
    enable = true;
    configFile = pkgs.writeText "hyprpaper.conf" ''
      preload = "${hyprpaperConfig.preload}";
      wallpaper = "${hyprpaperConfig.wallpaper}";
      splash = ${toString hyprpaperConfig.splash};
    '';
  };
}
