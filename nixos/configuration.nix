{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;

  imports = [
          ./hardware-configuration.nix
          ../host/desktop
            ];

    # mozc
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [ fcitx5-mozc ];
    };
    i18n.inputMethod.fcitx5.waylandFrontend = true;

    # bluetooth
    hardware.bluetooth.enable = true;

    # flakes
    nix.settings.experimental-features = [ "nix-command" "flakes"];

    # evn
    environment.variables = {
    SSL_CERT_FILE = "/etc/ssl/certs/ca-certificates.crt";
          };

    # NextDNS allowance
    systemd.services.resolved = {
      environment = {
        DNSOverTLS = "yes";
      };
    };

    # Audio
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
       extraConfig.pipewire."92-low-latency" = {
        "context.properties" = {
        "default.clock.rate" = 384000;
        "default.clock.quantum" = 1024;   # Buffer size for lower latency
        "default.clock.min-quantum" = 512;  # Minimum quantum size
        "default.clock.max-quantum" = 512;  # Maximum quantum size
            };
           };
          };

  # xserver
  services.xserver = {
        enable = true;
        displayManager = {
        sddm.enable = true;
        sddm.theme= "$import ./sddm-theme.nix {inherit pkgs;}}";
                };
        };
  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  # network
    networking.hostName = "aramjonghu";
    networking.networkmanager.enable = true;

  # garbage collection
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

  hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };
  services.xserver.videoDrivers = ["amdgpu"];

  # Hyprland
  programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

  # Fonts
  fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        ];

  #Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

   i18n = {
   # Default language (interface and system messages)
   defaultLocale = "en_US.UTF-8";

   # Supported languages (add en_US, nl_NL, and ja_JP)
   supportedLocales = [
     "en_US.UTF-8/UTF-8"
     "nl_NL.UTF-8/UTF-8"
     "ja_JP.UTF-8/UTF-8"
   ];

   # Additional locale settings
   extraLocaleSettings = {
     LC_ADDRESS = "nl_NL.UTF-8";
     LC_IDENTIFICATION = "nl_NL.UTF-8";
     LC_MEASUREMENT = "nl_NL.UTF-8";
     LC_MONETARY = "nl_NL.UTF-8";
     LC_NAME = "nl_NL.UTF-8";
     LC_NUMERIC = "nl_NL.UTF-8";
     LC_PAPER = "nl_NL.UTF-8";
     LC_TELEPHONE = "nl_NL.UTF-8";

     # Set LC_TIME to en_US for English day/month names but Dutch time format
     LC_TIME = "en_US.UTF-8";
   };
 };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aramjonghu = {
    isNormalUser = true;
    description = "Aram";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}