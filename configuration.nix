{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./hosts/desktop.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.aramjonghu = import ./home/home.nix;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
  };

  environment.shells = with pkgs; [ zsh ];

  environment.systemPackages = with pkgs; [
    # Build tools or languages
    stdenvNoCC gcc cmake meson ninja pkg-config scdoc git nix-prefetch-git 
    curl wget python3 rustup jdk jdk8 gnumake zig

    # Debugging and monitoring
    ncdu eza killall fastfetch

    # Misc
    ntfs3g efibootmgr mutagen zenity cryptsetup openssl cacert openssh 
    firewalld pkg-config appimage-run home-manager fwupd lact polkit 
    ffmpeg nvtopPackages.amd

    # Libraries
    libxkbcommon libavif dotnet-sdk dotnet-runtime icu glibc glib fuse fuseiso 
    opentabletdriver libwacom

    # Cursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # SDDM
    (callPackage ./modules/sddm/sddm-rose-pine.nix {})
  ];

  programs = {
    steam.gamescopeSession.enable = true;
    hyprland = {
      enable = true;
      withUWSM  = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    zsh.enable = true;
    appimage.binfmt = true;
    appimage.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use of file system and video sharing
  xdg.portal ={
    enable = true;
    extraPortals = [  pkgs.xdg-desktop-portal 
                      pkgs.xdg-desktop-portal-gtk 
                      pkgs.xdg-desktop-portal-kde 
                      pkgs.xdg-desktop-portal-wlr 
                      pkgs.xdg-desktop-portal-gnome 
                      ];
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
    BROWSER = "firefox";
    TERMINAL = "wezterm";
    XDG_MENU_PREFIX = "plasma-";
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
    GDK_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
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

  system.stateVersion = "unstable";
}
