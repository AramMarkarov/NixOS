{ config, pkgs, ... }: {

# Clone osu-winello repo if not present (currently not working)
    home.file = {
      ".config/osu-winello" = {
        source = pkgs.fetchgit {
          url = "https://github.com/NelloKudo/osu-winello.git";
          rev = "master";  # Specify the branch or commit hash
          sha256 = "0zjxh85r7lryr27jxws3n63yflasxxi9c9sww6yyczzi9fa0pzxy";
        };
      };
    };

      # Create .desktop file for osu!
      home.file."${config.home.homeDirectory}/.local/share/applications/osu-wine.desktop".text = ''
      [Desktop Entry]
      Name=osu!
      Comment=Play osu!
      Exec=steam-run"${config.home.homeDirectory}/.config/osu-winello/osu-wine"
      Icon=${config.home.homeDirectory}/.config/osu-winello/stuff/osu-wine.png
      Terminal=false
      Type=Application
      Categories=Game;
      '';
}