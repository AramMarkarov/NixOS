{ config, pkgs, ... }:

{

  imports = [
      ./programs
    ];

  home = {
      username = "aramjonghu";
      homeDirectory = "/home/aramjonghu";
    };

  programs.home-manager.enable = false;

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
    discord
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
    hyprpaper
    hyprshot
    kdePackages.dolphin
    hyprlock
    kdePackages.systemsettings # Remove if virtual keyboard is fixed (fcitx)
    hyprpanel

    # DE requirements
    libnotify
    upower
    kdePackages.dolphin-plugins
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    libgtkflow4
    kdePackages.ark
    brightnessctl
    bluez
    libgtop
    networkmanager
    gnomeExtensions.aylurs-widgets
    gnomeExtensions.bluetooth-battery
    ];

  # Home Manager state version
  home.stateVersion = "unstable";
}
