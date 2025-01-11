{config, pkgs, inputs, ... }:

{
  imports = [
      ./programs
      inputs.nixvim.homeManagerModules.nixvim
    ];

  programs.home-manager.enable = true;
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

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
    networkmanagerapplet
    ventoy-full

    # Wine and Wine tools
    wine
    winetricks
    wine-staging

    # Audio/video tools
    calf
    cava
    easyeffects
    ffmpeg_7-full
    pwvucontrol
    argyllcms

    # Spotify tools/rosepine themes
    fcitx5-rose-pine
    rose-pine-cursor
    rose-pine-icon-theme

    # Common applications
    tor-browser
    discord-canary
    ungoogled-chromium
    vesktop
    firefox #remove when home-manager is functional
    teams-for-linux
    thunderbird
    libsForQt5.kdenlive
    kdePackages.systemsettings
    obs-studio
    vlc
    alacritty
    zellij
    spotify
    mendeley
    libreoffice
    virtualbox
    davinci-resolve

    # IDE's & txteditors
    jetbrains.datagrip
    jetbrains.idea-ultimate
    jetbrains.jdk
    nano
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
    hyprsunset

    # DE requirements
    btop
    hyprland-qtutils
    libsForQt5.qt5ct
    libsForQt5.qt5.qtquickcontrols
    libsForQt5.qt5.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
    nwg-look
    kdePackages.qt6ct
    kdePackages.breeze
    libnotify
    hyprcursor
    hypridle
    kdePackages.dolphin-plugins
    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland
    hyprutils
    hyprsunset
    hyprlang
    hyprgraphics
    kdePackages.qtsvg
    kdePackages.kio
    kdePackages.kio-admin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.xdg-desktop-portal-kde
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
