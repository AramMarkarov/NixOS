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
  nixpkgs.config.allowUnfreePredicate = _: true;

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
    cava
    easyeffects
    ffmpeg_7-full
    pwvucontrol

    # Spotify tools
    spicetify-cli

    # Common applications
    tor-browser
    gimp-with-plugins
    ungoogled-chromium
    discord-canary
    vesktop
    firefox
    teams-for-linux
    thunderbird
    libsForQt5.kdenlive
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
    jetbrains.idea-ultimate
    jetbrains.jdk
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
    nwg-look
    kdePackages.qt6ct
    kdePackages.kmime
    kdePackages.qt6gtk2
    kdePackages.kservice
    kdePackages.breeze
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
    playerctl
    kdePackages.plasma-workspace
    wl-clipboard
    wl-clip-persist
    cliphist
    ];
}
