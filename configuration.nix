{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./hosts/laptop.nix # Change to correct host
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.aramjonghu = import ./home/home.nix;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
  };

  environment.systemPackages = with pkgs; [
    # Build tools
    gcc cmake meson ninja pkg-config scdoc git nix-prefetch-git curl wget python3 rustup jdk jdk8 gnumake

    # Debugging and monitoring
    htop ncdu eza killall fastfetch

    # Misc
    zenity cryptsetup openssl cacert openssh firewalld pkg-config appimage-run home-manager fwupd lact polkit ffmpeg libavif

    # Cursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # Audio
    alsa-utils pipewire wireplumber
  ];

  programs.hyprland.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use of file system and video sharing
  xdg.portal ={
    enable = true;
    extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
    ];
    wlr.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  security.polkit.enable = true;
  programs.appimage.binfmt = true;
  programs.appimage.enable = true;

  nixpkgs = {
    config.allowBroken = true;
    config.allowUnfree = true;
    config.allowUnsupportedSystem = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Time zone
  time.timeZone = "Europe/Amsterdam";

  # User
  users.users.aramjonghu = {
    isNormalUser = true;
    description = "Aram";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Env variables
  environment.variables = {
    SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
  };

  # Hostname (Change if needed)
  networking.hostName = "nixos";

  system.stateVersion = "unstable";
}
