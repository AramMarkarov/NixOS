{
  imports = [
    ./hardware-configuration.nix
    ./modules/
    ./host/desktop.nix # Change to correct host
  ];

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
      exa
      killall
      fastfetch

      # Misc
      openssl
      cacart #(ca certs for...)
      openssh
      firewalld
      pkg-config
  ];

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
  virtualisation.docker.enable = true;

  # Set Docker's storage driver to Btrfs (if using Btrfs filesystem)
  virtualisation.docker.storageDriver = "btrfs";

  # Optionally, enable rootless Docker (for better security)
  virtualisation.docker.rootless.enable = true;

  system.stateVersion = "24.05";
}
