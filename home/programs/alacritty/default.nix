{config, pkgs, lib, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      # Import external configuration (if any)
      import = [];
      # Window settings
      window = {
        opacity = 0.9;
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "Full";
        decorations_theme_variant = "Dark"; # Options: "Light" or "Dark"
      };
    };
  };
}
