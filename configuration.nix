{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./hosts/desktop.nix # Change to correct host
  ];

  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
  # Build tools
      gcc
      cmake
      meson
      ninja
      pkg-config
      scdoc
      git
      nix-prefetch-git
      curl
      wget
      python3
      rustup
      jdk
      jdk8
      gnumake

      # Debugging and monitoring
      htop
      ncdu
      eza
      killall
      fastfetch

      # Misc
      openssl
      cacert #(ca certs for...)
      openssh
      firewalld
      pkg-config
      appimage-run
  ];

  # Use of file system and video sharing
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde ];

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;
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
      NIXPKGS_ALLOW_UNFREE = "1";
      SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
        };

  # Hostname (Change if needed)
  networking.hostName = "nixos";

  # Virtualization
  #virtualisation.docker.enable = true;

  # Set Docker's storage driver to Btrfs (if using Btrfs filesystem)
  #virtualisation.docker.storageDriver = "btrfs";

  # Optionally, enable rootless Docker (for better security)
  #virtualisation.docker.rootless.enable = true;

  system.stateVersion = "24.05";
}