{config, pkgs, inputs, ... }:

{
  imports = [
      ./programs
      inputs.nixvim.homeManagerModules.nixvim
    ];

  programs.home-manager.enable = true;
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    allowUnsupportedSystem = true;    
    allowUnfreePredicate = _: true;
  };
  
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
    gimp-with-plugins
    tor-browser
    discord-canary
    ungoogled-chromium
    vesktop
    firefox #remove when home-manager is functional
    teams-for-linux
    thunderbird
    kdePackages.kdenlive
    kdePackages.systemsettings
    obs-studio
    vlc
    alacritty
    zellij
    spotify
    mendeley
    libreoffice
    virtualbox

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
    hyprlock
    kdePackages.dolphin
    kdePackages.kmime
    hyprpicker
    hyprpanel
    hyprsunset

    # DE requirements
    btop
    hyprland-qtutils
    nwg-look
    kdePackages.qt6ct
    kdePackages.qt6gtk2
    kdePackages.qtsvg
    kdePackages.plasma-workspace
    kdePackages.breeze
    kdePackages.kservice
    libnotify
    hyprcursor
    hypridle
    kdePackages.dolphin-plugins
    kdePackages.qtwayland
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
    wl-clipboard
    wl-clip-persist
    cliphist
    ];
}
