{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./hosts/desktop.nix
  ];
  environment.shells = with pkgs; [ zsh ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

# Use of file system and video sharing
  xdg.portal ={
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal ];
  };

  security.polkit.enable = true;
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  nixpkgs.config = {
      allowBroken = true;
      allowUnfree = true;
      allowUnsupportedSystem = true;    
      allowUnfreePredicate = _: true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Bootloader
  boot.loader = {
      efi.canTouchEfiVariables = true;
      grub = {
          enable = true;
          devices = [ "nodev" ];
          efiSupport = true;
          useOSProber = true;
      };
  };

# Time zone
  time.timeZone = "Europe/Amsterdam";
  time.hardwareClockInLocalTime = true;

# User
  users.users.aramjonghu = {
      isNormalUser = true;
      description = "Aram";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.zsh;
  };

# Env variables
  environment.variables = {
    SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
    EDITOR = "nvim";
    BROWSER = "floorp";
    TERM = "wezterm";
    TERMINAL = "wezterm";
    VISUAL = "nvim";
    EDITOR = "nvim";
    XDG_MENU_PREFIX = "arch-";
    HYPRCURSOR_THEME = "rose-pine-hyprcursor";
    HYPRCURSOR_SIZE = "24";
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11,*";
    SDL_VIDEODRIVER = "wayland,x11";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_PICTRES_HOME = "$HOME/Pictures";
    HYPRSHOT_DIR = "$HOME/Pictures/Screenshots";
  };

  # Mount drives
  fileSystems."/mnt/HDD" = {
    device = "/dev/sda1";
    fsType = "btrfs";
    options = [ "compress=zstd" "noatime" "autodefrag" ];
  };

  # Hostname (Change if needed)
  networking.hostName = "nixos";

  system.stateVersion = "25.05";
}
