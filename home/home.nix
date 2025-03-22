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
    # Desktop only/wine & proton
    steam-run
    dxvk
    protonup
    gamescope
    #minecraft
    #steam
    #lutris

    # Networking and communication
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
    easyeffects
    ffmpeg_7-full
    pwvucontrol
    argyllcms

    # Rosepine themes
    fcitx5-rose-pine
    rose-pine-cursor

    # Emulators
    pcsx2
    snes9x
    rpcs3
    desmume
    simple64

    # Common Apps
    qbittorrent
    teamspeak5_client
    gimp-with-plugins
    tor-browser
    signal-desktop
    discord-canary
    ungoogled-chromium
    vesktop
    mullvad-vpn
    firefox
    floorp
    teams-for-linux
    thunderbird
    kdePackages.kdenlive
    obs-studio
    vlc
    spotify
    mendeley
    libreoffice
    virtualbox

    # Terminals
    wezterm
    cool-retro-term
    kitty

    # IDE's & txteditors
    jetbrains.datagrip
    processing
    arduino-ide
    arduino-cli
    drawio

    # Plugins & stuff
    arrpc
    nodejs_22

    # Desktop Environment requirements (hyprland)
    wofi
    swww
    hyprshot
    hyprlock
    nautilus
    hyprpicker
    hyprpanel
    hyprsunset

    # DE requirements
    btop
    hyprland-qtutils
    nwg-look
    gtk3
    gtk4
    kdePackages.qt6ct
    kdePackages.qt6gtk2
    kdePackages.qtsvg
    kdePackages.plasma-workspace
    kdePackages.breeze
    kdePackages.kservice
    libnotify
    hyprcursor
    hypridle
    kdePackages.qtwayland
    hyprutils
    hyprsunset
    hyprlang
    hyprgraphics
    xdg-desktop-portal-gtk
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
    playerctl
    wl-clipboard
    wl-clip-persist
    cliphist
    ];
}
