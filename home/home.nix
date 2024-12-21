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

    # Networking and communication
    wget
    filezilla
    croc
    networkmanagerapplet

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
    spotify
    mendeley
    libreoffice
    zellij
    
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
    hyprpanel
    ags
    udiskie
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.breeze

    # DE requirements
    btop
    libnotify
    cameractrls
    hyprcursor
    hypridle
    matugen
    kdePackages.dolphin-plugins
    kdePackages.kio
    kdePackages.kio-admin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    kdePackages.xdg-desktop-portal-kde
    libgtkflow4
    kdePackages.ark
    brightnessctl
    bluez
    libgtop
    wlroots
    kitty
    playerctl
    kdePackages.plasma-workspace
    wl-clipboard
    wl-clipboard-x11
    wl-clip-persist
    cliphist
    ];
}
