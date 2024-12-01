{config, pkgs, ... }:

{

  imports = [
      ./programs
    ];

  programs.home-manager.enable = true;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.variables = ["--all"];
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
    discord-canary
    vesktop
    mullvad-browser
    brave
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
    
    # IDE's & txteditors
    jetbrains.datagrip
    jetbrains.idea-ultimate
    vscode
    kate
    nano
    neovim
    processing
    arduino-ide

    # Plugins & stuff
    obs-studio-plugins.obs-pipewire-audio-capture
    arrpc
    nodejs_22

    # Desktop Environment requirements (hyprland)
    wofi
    swww
    hyprshot
    kdePackages.dolphin
    hyprlock
    kdePackages.systemsettings # Remove if virtual keyboard is fixed (fcitx)
    hyprpanel
    ags

    # DE requirements
    libnotify
    xdg-desktop-portal-hyprland
    hyprcursor
    upower
    kdePackages.dolphin-plugins
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio
    kdePackages.kio-admin
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.xwaylandvideobridge
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
    ];
}
