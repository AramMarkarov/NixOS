{ config, pkgs, libs, inputs,  ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
    ];

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
      grub = {
          enable = true;
          devices = [ "nodev" ];
          efiSupport = true;
          useOSProber = true;
          theme = pkgs.catppuccin-grub;
          };
  };
  
  qt = {
      enable = true;
      style = "breeze";
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";
  time.hardwareClockInLocalTime = true;

  virtualisation = {
      spiceUSBRedirection.enable = true;
      libvirtd = {
        enable = true;
        qemu = {
            vhostUserPackages = [ pkgs.virtiofsd ];
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true;
            ovmf = {
                enable = true;
                packages = [(pkgs.OVMF.override {
                      secureBoot = true;
                      tpmSupport = true;
                      }).fd];
            };
        };
    };
  };

  users.groups.libvirtd.members = [ "aram" ];

  users.users.aram = {
    isNormalUser = true;
    description = "aram";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "dialout" ];
  };

  users.defaultUserShell = pkgs.zsh;

  # Use of file system and video sharing
  xdg.portal ={
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk
                       pkgs.kdePackages.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-wlr 
                       pkgs.xdg-desktop-portal-hyprland];
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

  # Env variables
  environment.variables = {
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1";
    SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
    BROWSER = "qutebrowser";
    TERM = "wezterm";
    TERMINAL = "wezterm";
    VISUAL = "nvim";
    EDITOR = "nvim";
    HYPRCURSOR_THEME = "catppuccin-cursor.macchiatoLavender";
    HYPRCURSOR_SIZE = "24";
    XCURSOR_THEME = "catppuccin-cursor.macchiatoLavender";
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

  system.stateVersion = "25.05"; # Did you read the comment?

}
