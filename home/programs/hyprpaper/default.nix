{ config, pkgs, lib, ... }:

let
  hyprpaperConfig = {
    preload = "/wallpapers/DSC00301.JPG";  # Path to the wallpaper image
    wallpaper = "/wallpapers/DSC00301.JPG";  # Path to the wallpaper image
    splash = false;
  };
in {
  # Create the hyprpaper configuration file at the desired location
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = "${hyprpaperConfig.preload}";
    wallpaper = "${hyprpaperConfig.wallpaper}";
    splash = ${toString hyprpaperConfig.splash};
  '';
}
