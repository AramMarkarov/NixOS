{
  imports = [
    ./hyprland
    ./wofi
    ./zsh
    ./nixvim
  ];

  xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
          "application/pdf" = [ "firefox.desktop" ];
          "text/plain" = [ "idea-ultimate.desktop" ];
          "text/html" = [ "idea-ultimate.desktop" ];
          "x-scheme-handler/http" = [ "firefox.desktop" ];
          "x-scheme-handler/https" = [ "firefox.desktop" ];
          "x-scheme-handler/about" = [ "firefox.desktop" ];
          "x-scheme-handler/unknown" = [ "firefox.desktop" ];
          "image/jpeg" = [ "firefox.desktop" ];
          "image/png" = [ "firefox.desktop" ];
          "video/mp4" = [ "vlc.desktop" ];
          "audio/mpeg" = [ "vlc.desktop" ];
          "application/zip" = [ "org.kde.ark.desktop" ];
          "application/x-tar" = [ "org.kde.ark.desktop" ];
          "application/x-7z-compressed" = [ "org.kde.ark.desktop" ];
          "application/x-rar" = [ "org.kde.ark.desktop" ];
          "application/x-xz-compressed-tar" = ["org.kde.ark.desktop"];
          "application/vnd.ms-excel" = [ "calc.desktop" ];
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "calc.desktop" ];
          "application/vnd.ms-powerpoint" = [ "impress.desktop" ];
          "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "impress.desktop" ];
          "application/msword" = [ "writer.desktop" ];
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "writer.desktop" ];
          "application/x-shellscript" = [ "wezterm.desktop" ];
          "application/x-executable" = [ "wezterm.desktop" ];
          "application/x-arduino" = [ "arduino-ide.desktop" ];
          "text/x-java" = [ "idea-ultimate.desktop" ];
          "application/x-python" = [ "idea-ultimate.desktop" ];
          "application/x-php" = [ "idea-ultimate.desktop" ];
          "text/javascript" = [ "idea-ultimate.desktop" ];
          "application/x-csrc" = [ "idea-ultimate.desktop" ];
          "application/x-c++src" = [ "idea-ultimate.desktop" ];
          "application/x-cppsrc" = [ "idea-ultimate.desktop" ];
          "application/x-csharp" = [ "idea-ultimate.desktop" ];
          "application/x-zerosize" = [ "idea-ultimate.desktop" ];
          "application/sql" = [ "datagrip.desktop" ];
        };
  };
}
