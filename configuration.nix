{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./hosts/desktop.nix # Change to correct host
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
    # Build tools
    stdenvNoCC gcc cmake meson ninja pkg-config scdoc git nix-prefetch-git curl wget python3 rustup jdk jdk8 gnumake

    # Debugging and monitoring
    htop ncdu eza killall fastfetch

    # Misc
    efibootmgr mutagen zenity cryptsetup openssl cacert openssh firewalld pkg-config appimage-run home-manager fwupd lact polkit ffmpeg

    # Libraries
    libavif dotnet-sdk dotnet-runtime icu glibc glib fuse fuseiso opentabletdriver libwacom

    # Cursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # SDDM
    (callPackage ./modules/sddm/sddm-rose-pine.nix {})
  ];

  # SDDM Theme
  services.xserver.displayManager.sddm.theme = "rose-pine";

  programs = {
    hyprland.enable = true;
    hyprland.withUWSM  = true;
    zsh.enable = true;
    appimage.binfmt = true;
    appimage.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use of file system and video sharing
  xdg.portal ={
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gnome ];
    };

  security.polkit.enable = true;
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  
  nixpkgs = {
    config.allowBroken = true;
    config.allowUnfree = true;
    config.allowUnsupportedSystem = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        };
    };

  # Time zone
  time.timeZone = "Europe/Amsterdam";

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
  };

  # Hostname (Change if needed)
  networking.hostName = "nixos";

  system.stateVersion = "unstable";
}
