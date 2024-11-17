{config, pkgs, lib, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      # Import external configuration (if any)
      import = [];

      # Configure Alacritty font
      font = {
        normal = {
          family = "Hack";
          style = "Medium";
        };
        size = 12;
      };

      # Window settings
      window = {
        opacity = 0.9;
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "Full";
        decorations_theme_variant = "Light"; # Options: "Light" or "Dark"
      };
    };
  };
}
