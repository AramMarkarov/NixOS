{
  imports = [
    ./hyprland
    ./zsh
    ./wofi
    ./nixvim
    ./wezterm
    #./floorp
    #./hyprpanel
  ];

  xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus" ];
        "application/pdf" = [ "draw.desktop" ];
        "text/plain" = [ "nvim.desktop" ];
        "text/html" = [ "nvim.desktop" ];
        "x-scheme-handler/http" = [ "floorp.desktop" ];
        "x-scheme-handler/https" = [ "floorp.desktop" ];
        "x-scheme-handler/about" = [ "floorp.desktop" ];
        "x-scheme-handler/unknown" = [ "floorp.desktop" ];
        "image/jpeg" = [ "floorp.desktop" ];
        "image/png" = [ "floorp.desktop" ];
        "video/mp4" = [ "vlc.desktop" ];
        "audio/mpeg" = [ "vlc.desktop" ];
        "application/zip" = [ "org.kde.ark.desktop" ];
        "application/x-osu-skin-archive" = ["org.kde.ark.desktop"];
        "application/x-tar" = [ "org.kde.ark.desktop" ];
        "application/x-7z-compressed" = [ "org.kde.ark.desktop" ];
        "application/x-rar" = [ "org.kde.ark.desktop" ];
        "application/vnd.ms-excel" = [ "calc.desktop" ];
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "calc.desktop" ];
        "application/vnd.ms-powerpoint" = [ "impress.desktop" ];
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "impress.desktop" ];
        "application/msword" = [ "writer.desktop" ];
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "writer.desktop" ];
        "application/x-shellscript" = [ "wezterm.desktop" ];
        "application/x-executable" = [ "wezterm.desktop" ];
        "application/x-arduino" = [ "arduino-ide.desktop" ];
        "text/x-java" = [ "nvim.desktop" ];
        "application/x-python" = [ "nvim.desktop" ];
        "application/x-php" = [ "nvim.desktop" ];
        "text/javascript" = [ "nvim.desktop" ];
        "application/x-csrc" = [ "nvim.desktop" ];
        "application/x-c++src" = [ "nvim.desktop" ];
        "application/x-cppsrc" = [ "nvim.desktop" ];
        "application/x-csharp" = [ "nvim.desktop" ];
        "application/x-zerosize" = [ "nvim.desktop" ];
        "application/sql" = [ "datagrip.desktop" ];
      };
    };
}
