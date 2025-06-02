{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Build tools 
    stdenvNoCC gcc cmake meson ninja pkg-config scdoc git nix-prefetch-git 
    curl wget gnumake rocmPackages.clr

    # Langauges
    python3 zig rustup jdk jdk8  
    
    # Debugging and monitoring
    ncdu killall fastfetch clinfo yazi vulkan-tools 

    # Misc
    ntfs3g efibootmgr mutagen zenity cryptsetup openssl cacert openssh 
    firewalld pkg-config appimage-run home-manager fwupd lact polkit 
    ffmpeg nvtopPackages.amd

    # Libraries
    libxkbcommon libavif dotnet-sdk dotnet-runtime icu glibc glib glibmm fuse 
    fuseiso opentabletdriver libwacom

    # Cursor
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default

    # SDDM
    catppuccin-sddm.override {
        flavor = "macchiato";
        font  = "0xProto Nerd Font";
        fontSize = "10";
        background = "${./wallpaper.png}";
        loginBackground = true;
    }
    
    # Hyprland stuff
    hyprpanel fuzzel hyprland-workspaces hyprlock hyprpaper wl-clipboard hyprpicker
    hyprlang hypridle hyprsunset hyprcursor hyprpolkitagent
    hyprwayland-scanner hyprland-qt-support astal.hyprland

    # Programs
    Chromium signal-desktop telegram-desktop vesktop teams kdePackages.kdenlive
    bolt-launcher drawio libreoffice-still hunspell hunspellDicts.nl_NL
    hunspellDicts.en_US hunspellDicts.en_GB-ise jetbrains.datagrip youtube-music
    gimp3-with-plugins mendeley qbittorrent protonvpn-gui protonmail-desktop vlc

    # Games
    minecraft lutris steam-run heroic pcsx2 snes9x

    # Settings & Utils
    kdePackages.qt6ct solaar nautilus kdePackages.dolphin libsForQt5.qt5ct
    pavucontrol gparted wezterm btop-rocm arduino-cli arduino-ide
    kdePackages.ark easyeffects ventoy-full protonup-qt mullvad-vpn yazi
    wine-staging
  ];
  
  programs = {
    steam.gamescopeSession.enable = true;
    hyprland = {
      enable = true;
      withUWSM  = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
    zsh.enable = true;
    appimage.binfmt = true;
    appimage.enable = true;
    floorp.enable = true;
    wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-backgroundremoval
            obs-pipewire-audio-capture
        ]
    }
    thunderbird.enable = true;
    steam.enable = true;
    neovim = {
        enable = true;
        defaultEditor = true;
    }
  };
}
