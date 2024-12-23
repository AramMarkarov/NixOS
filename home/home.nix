{config, pkgs, ... }:

{
  imports = [
      ./programs
    ];

  programs.home-manager.enable = true;
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;

  home = {
        username = "aramjonghu";
        homeDirectory = "/home/aramjonghu";
        stateVersion = "25.05";
      };

  programs.git = {
      enable = true;
      userName  = "arammarkarov";
      userEmail = "a.markarov@outlook.com";
    };

  # User-specific development tools
  home.packages = with pkgs; [
    # Desktop only
    steam-run
    dxvk
    protonup
    gamescope
    minecraft
    steam
    lutris

    # Networking and communication
    wget
    filezilla
    croc

    # Wine and Wine tools
    wine
    winetricks
    wine-staging

    # Audio/video tools
    calf
    easyeffects
    ffmpeg_7-full
    pwvucontrol

    # Common applications
    tor-browser
    discord-canary
    vesktop
    firefox
    teams-for-linux
    thunderbird
    libsForQt5.kdenlive
    obs-studio
    vlc
    alacritty
    zellij
    spotify
    mendeley
    libreoffice
    
    # IDE's & txteditors
    jetbrains.datagrip
    jetbrains.idea-ultimate
    jetbrains.jdk
    vscode
    kate
    nano
    neovim
    processing
    arduino-ide

    # Plugins & stuff
    arrpc
    nodejs_22

    # Desktop Environment requirements (hyprland)
    wofi
    swww
    hyprshot
    kdePackages.dolphin
    hyprlock
    hyprpicker
    hyprpanel
    ags
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.breeze

    # DE requirements
    libnotify
    hyprcursor
    kdePackages.dolphin-plugins
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio
    kdePackages.kio-admin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.xdg-desktop-portal-kde
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    libgtkflow4
    kdePackages.ark
    brightnessctl
    bluez
    libgtop
    dart-sass
    gnome-bluetooth
    networkmanager
    wlroots
    kitty
    playerctl
    kdePackages.plasma-workspace
    wl-clipboard
    wl-clip-persist
    cliphist
    ];
}
