{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "kate";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
      GBM_BACKEND = "amdgpu";
      __GLX_VENDOR_LIBRARY_NAME = "amdgpu";
      LIBVA_DRIVER_NAME = "amdgpu";
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      CLUTTER_BACKEND = "wayland";
      WLR_RENDERER = "vulkan";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };

  home-manager.users.aramjonghu = {
    xdg = {
      mimeApps = {
        enable = true;
        defaultApplications = {
          "video/*" = [ "vlc.desktop" ];
          "audio/*" = [ "vlc.desktop" ];
          "image/*" = [ "firefox" ];
          "text/html" = [ "firefox" ];
          "application/pdf" = [ "firefox" ];
          "application/vnd.oasis.opendocument.text" = [ "libreoffice-writer.desktop" ]; # ODT
          "application/msword" = [ "libreoffice-writer.desktop" ]; # DOC
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "libreoffice-writer.desktop" ]; # DOCX
          "application/vnd.oasis.opendocument.spreadsheet" = [ "libreoffice-calc.desktop" ]; # ODS
          "application/vnd.ms-excel" = [ "libreoffice-calc.desktop" ]; # XLS
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "libreoffice-calc.desktop" ]; # XLSX
          "application/vnd.oasis.opendocument.presentation" = [ "libreoffice-impress.desktop" ]; # ODP
          "application/vnd.ms-powerpoint" = [ "libreoffice-impress.desktop" ]; # PPT
          "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "libreoffice-impress.desktop" ]; # PPTX
        };
      };
    };
  };
 };
}
