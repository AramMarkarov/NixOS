{ config, pkgs, ... }:

let
  # Directory for your wofi configuration files
  wofiConfigDir = "${config.home.homeDirectory}/.config/wofi";
in
{
  # Deploy all four files into ~/.config/wofi/
  home.file."${wofiConfigDir}/config".text = ''
      width=400
      height=600
      location=center
      show=drun
      prompt=Search...
      filter_rate=100
      allow_markup=true
      no_actions=true
      halign=fill
      orientation=vertical
      content_halign=fill
      insensitive=true
      allow_images=true
      image_size=64
      gtk_dark=true
    '';

  home.file."${wofiConfigDir}/menu".text = ''
      # Config for wofi-wifi-menu

      # position values:
      # 1 2 3
      # 8 0 4
      # 7 6 5
      POSITION=3

      # y-offset
      YOFF=15

      # x-offset
      XOFF=-30

      # fields to be displayed
      FIELDS=SSID,IN-USE,BARS,SECURITY
    '';

  home.file."${wofiConfigDir}/menu.css".text = ''
    @import ".config/wofi/style.css";
    window {
      font-family: "FiraCode Nerd Font Mono";
      font-size: 13px;
    }
  '';


  home.file."${wofiConfigDir}/style.css".text = ''
    window {
        margin: 0px;
        background-color: #232136;
        border-radius: 0px;
        border: 2px solid #eb6f92;
        color: #e0def4;
        font-family: 'Monofur Nerd Font';
        font-size: 20px;
    }

    #input {
        margin: 5px;
        border-radius: 0px;
        border: none;
        border-radius: 0px;;
        color: #eb6f92;
        background-color: #393552;

    }

    #inner-box {
        margin: 5px;
        border: none;
        background-color: #393552;
        color: #232136;
        border-radius: 0px;
    }

    #outer-box {
        margin: 15px;
        border: none;
        background-color: #232136;
    }

    #scroll {
        margin: 0px;
        border: none;
    }

    #text {
        margin: 5px;
        border: none;
        color: #e0def4;
    }

    #entry:selected {
        background-color: #eb6f92;
        color: #232136;
        border-radius: 0px;;
        outline: none;
    }

    #entry:selected * {
        background-color: #eb6f92;
        color: #232136;
        border-radius: 0px;;
        outline: none;
    }
  '';
}
