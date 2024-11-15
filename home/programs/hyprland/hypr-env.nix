{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
      EDITOR = "kate";
      BROWSER = "mullvad-browser";
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

    xdg = {
      mimeApps = {
        "defaultApplications" = {
          "video/*" = [ "vlc.desktop" ];
          "audio/*" = [ "vlc.desktop" ];
        };
      };
    };
  };
}
