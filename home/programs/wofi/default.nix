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
        border: 5px solid #f5c2e7;
        background-color: #f5c2e7;
        border-radius: 15px;
    }

    #input {
        padding: 4px;
        margin: 4px;
        padding-left: 20px;
        border: none;
        color: #fff;
        font-weight: bold;
        background-color: #fff;
        background: linear-gradient(90deg, rgba(203,166,247,1) 0%, rgba(245,194,231,1) 100%);
        outline: none;
        border-radius: 15px;
        margin: 10px;
        margin-bottom: 2px;
    }
    #input:focus {
        border: 0px solid #fff;
        margin-bottom: 0px;
    }

    #inner-box {
        margin: 4px;
        border: 10px solid #fff;
        color: #cba6f7;
        font-weight: bold;
        background-color: #fff;
        border-radius: 15px;
    }

    #outer-box {
        margin: 0px;
        border: none;
        border-radius: 15px;
        background-color: #fff;
    }

    #scroll {
        margin-top: 5px;
        border: none;
        border-radius: 15px;
        margin-bottom: 5px;
    }

    #text:selected {
        color: #fff;
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
    }

    #entry {
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
        background-color: transparent;
    }

    #entry:selected {
        margin: 0px 0px;
        border: none;
        border-radius: 15px;
        background: linear-gradient(45deg, rgba(203,166,247,1) 30%, rgba(245,194,231,1) 100%);
    }
  '';
}
