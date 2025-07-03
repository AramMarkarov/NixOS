{ config, pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
    # Build tools 
        stdenvNoCC gcc cmake meson ninja pkg-config scdoc git nix-prefetch-git 
        curl wget gnumake rocmPackages.clr icu python313Packages.pip

    # Langauges
        python314 zig rustup jdk jdk24 jdk8 nodejs_24 mariadb_114 go perl

    # Debugging and monitoring
        ncdu killall fastfetch clinfo yazi vulkan-tools 

    # Misc
        ntfs3g efibootmgr mutagen zenity cryptsetup openssl cacert openssh 
        firewalld pkg-config appimage-run home-manager fwupd lact polkit 
        ffmpeg nvtopPackages.amd unzip kdePackages.plasma-workspace electron
        kdePackages.qtsvg kdePackages.kio-fuse kdePackages.kio-extras
        kdePackages.sddm-kcm kdePackages.kservice catppuccin-grub libvirt-glib

    # Cursors
        catppuccin-cursors.macchiatoLavender
    
    # Icons
        kdePackages.breeze-icons catppuccin-papirus-folders

    # Libraries
        libxkbcommon libavif dotnet-sdk dotnet-runtime icu glibc glib glibmm fuse 
        fuseiso opentabletdriver libwacom libmysqlclient

    # Hyprland stuff
        inputs.swww.packages.${pkgs.system}.swww hyprpanel hyprshot fuzzel 
        hyprland-workspaces hyprlock hyprpaper wl-clipboard cliphist hyprpicker 
        hyprgraphics hyprsysteminfo hyprland-qtutils hyprlang hypridle 
        hyprsunset hyprcursor hyprpolkitagent hyprwayland-scanner 
        hyprland-qt-support astal.hyprland playerctl xdg-desktop-portal 
        xdg-desktop-portal-gtk xdg-desktop-portal-hyprland 
        kdePackages.xdg-desktop-portal-kde power-profiles-daemon pywal16 
        imagemagick

    # Programs
        chromium signal-desktop telegram-desktop vesktop teams-for-linux 
        kdePackages.kdenlive bolt-launcher drawio libreoffice-still hunspell
        hunspellDicts.nl_NL hunspellDicts.en_US hunspellDicts.en_GB-ise
        jetbrains.datagrip gimp3-with-plugins mendeley qbittorrent 
        protonvpn-gui vlc obs-studio ladybird tor-browser virt-manager

    # Games
        prismlauncher lutris steam-run heroic pcsx2 snes9x

    # Settings & Utils
        kdePackages.qt6ct kdePackages.dolphin libsForQt5.qt5ct
        pavucontrol gparted wezterm btop-rocm arduino-cli arduino-ide
        kdePackages.ark easyeffects protonup-ng mullvad-vpn yazi
        wine-staging nwg-look colord gamemode networkmanagerapplet alsa-utils


    # ZSH stuff
        oh-my-posh fzf fzf-zsh

    # sddm
       (callPackage ./sddm-rose-pine.nix {})
    
    # Temp
    mesa-demos

    ];

    programs = {
        steam.gamescopeSession.enable = true;
        hyprland = {
            enable = true;
            withUWSM  = true;
        };
        zsh = {
            enable = true;
            autosuggestions.enable = true;
            ohMyZsh = {
                enable = true;
                plugins = [ "sudo" "extract" "sudo" "dirhistory" 
                    "cp" "colorize" ];
            };
            syntaxHighlighting.enable = true;
        };
        appimage.binfmt = true;
        appimage.enable = true;
        firefox.enable = true;
        thunderbird.enable = true;
        steam.enable = true;
        neovim = {
            enable = true;
            defaultEditor = true;
        };
    };
}
