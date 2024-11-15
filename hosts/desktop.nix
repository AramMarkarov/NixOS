{ config, lib, pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"]; # Change for Nvidia/Intel

  sound.enable = true;
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 384000; # Change depending on hardware
      "default.clock.quantum" = 1024; # Increase by doubling if you encounter audio stutters
      "default.clock.min-quantum" = 512;
      "default.clock.max-quantum" = 512;
    };
  };

  # Desktop-specific packages
    home.pacakges = with pkgs; [
      steam-run
      dxvk
      protonup
      gamescope
      minecraft
      steam
      lutris
      osu-winello
        ];

  # Clone osu-winello repo if not present
  home.file = {
    ".config/osu-winello" = {
      source = pkgs.fetchgit {
        url = "https://github.com/NelloKudo/osu-winello.git";
        rev = "master";  # Specify the branch or commit hash
        sha256 = "0zjxh85r7lryr27jxws3n63yflasxxi9c9sww6yyczzi9fa0pzxy";
      };
    };
  };

    # Create .desktop file for osu!
    home.file."${config.home.homeDirectory}/.local/share/applications/osu-winello.desktop".text = ''
    [Desktop Entry]
    Name=osu!
    Comment=Play osu!
    Exec=nix-shell -p steam-run --run "${config.home.homeDirectory}/.config/osu-winello/osu-wine"
    Icon=${config.home.homeDirectory}/.config/osu-winello/stuff/osu-wine.png
    Terminal=false
    Type=Application
    Categories=Game;
    '';
}
