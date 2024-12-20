{config, pkgs, lib, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      # Window settings
      window = {
        opacity = 0.9;
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "Full";
        decorations_theme_variant = "Dark";
      };
      colors = {
        bright = {
            black = "#444b6a";
            blue = "#7da6ff";
            cyan = "#0db9d7";
            green = "#b8f27c";
            magenta = "#bb9af7";
            red = "#ff7a93";
            white = "#acb0d0";
            yellow = "#ff9e64";
        };
        normal = {
            black = "#32344a";
            blue = "#7aa2f7";
            cyan = "#449dab";
            green = "#9ece6a";
            magenta = "#ad8ee6";
            red = "#f7768e";
            white = "#787c99";
            yellow = "#e0af68";
        };
        primary = {
            background = "#1a1b26";
            foreground = "#19b1d6";
        };
      };
      font = {
        size = 12.0;
        bold = {
            family = "0xProto Nerd Font Mono";
            style = "Bold";
        };
        bold_italic = {
            family = "0xProto Nerd Font Mono";
            style = "Bold Italic";
        };
        italic = {
            family = "0xProto Nerd Font Mono";
            style = "Italic";
        };
        normal = {
            family = "0xProto Nerd Font Mono";
            style = "Regular";
        };
      };
    };
  };
}
