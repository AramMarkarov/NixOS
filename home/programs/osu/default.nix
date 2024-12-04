{ config, pkgs, ... }: {

      # Creating a desktop file for osu!
      home.file."${config.home.homeDirectory}/.local/share/applications/osu-wine.desktop".text = ''
      [Desktop Entry]
      Name=osu!
      Comment=Play osu!
      Exec=steam-run"${config.home.homeDirectory}/.local/bin/osu-wine"
      Icon=${config.home.homeDirectory}/Games/osu-winello/stuff/osu-wine.png
      Terminal=false
      Type=Application
      Categories=Game;
      '';
}
