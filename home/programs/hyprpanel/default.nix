{ config, pkgs, ... }:

{
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
        };
        style = ''
        * {
            font-family: CartographCF Nerd Font,FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            font-size: 13px;
        }

        window#waybar {
            background-color: transparent;
        }

        #workspaces{
            background-color: transparent;
            border-radius: 15px;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-right: 10px;
            margin-left: 25px;
        }
        #workspaces button{
            box-shadow: rgba(0, 0, 0, 0.116) 2 2 5 2px;
            background-color: #fff ;
            border-radius: 15px;
            margin-right: 10px;
            padding-top: 4px;
            padding-bottom: 2px;
            padding-right: 10px;
            font-weight: bolder;
            color: 	#cba6f7 ;
        }

        #workspaces button.active{
            padding-right: 20px;
            box-shadow: rgba(0, 0, 0, 0.288) 2 2 5 2px;
            text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
            padding-left: 20px;
            padding-bottom: 3px;
            background: rgb(202,158,230);
            background: linear-gradient(45deg, rgba(202,158,230,1) 0%, rgba(245,194,231,1) 43%, rgba(180,190,254,1) 80%, rgba(137,180,250,1) 100%);
            background-size: 300% 300%;
            animation: gradient 10s ease infinite;
            color: #fff;
        }

        @keyframes gradient {
        	0% {
        		background-position: 0% 50%;
        	}
        	50% {
        		background-position: 100% 50%;
        	}
        	100% {
        		background-position: 0% 50%;
        	}
        }

        #window,
        #bluetooth,
        #clock,
        #battery,
        #cpu,
        #memory,
        #temperature,
        #network,
        #wireplumber,
        #custom-media {
            padding: 0 10px;
            border-radius: 15px;
            background-color: #cdd6f4;
            color: #516079;
            box-shadow: rgba(0, 0, 0, 0.116) 2 2 5 2px;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-right: 10px;
        }

        #custom-cycle_wall{
            background: rgb(245,194,231);
            background: linear-gradient(45deg, rgba(245,194,231,1) 0%, rgba(203,166,247,1) 0%, rgba(243,139,168,1) 13%, rgba(235,160,172,1) 26%, rgba(250,179,135,1) 34%, rgba(249,226,175,1) 49%, rgba(166,227,161,1) 65%, rgba(148,226,213,1) 77%, rgba(137,220,235,1) 82%, rgba(116,199,236,1) 88%, rgba(137,180,250,1) 95%);
            color: #fff;
            background-size: 500% 500%;
            animation: gradient 7s linear infinite;
            font-weight:  bolder;
            padding: 5px;
            border-radius: 15px;
        }

        #clock {
            background: rgb(245,194,231);
            background: linear-gradient(45deg, rgba(245,194,231,1) 0%, rgba(203,166,247,1) 64%, rgba(202,158,230,1) 100%);
            margin-right: 25px;
            color: #fff ;
            background-size: 300% 300%;
            text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
            animation: gradient 20s ease infinite;
            font-size: 15px;
            padding-top: 5px;
            padding-right: 21px;
            font-weight: bolder;
            padding-left: 20px
        }

        #battery.charging, #battery.plugged {
            background-color: #94e2d5 ;
        }

        #battery {
            background-color: #fff;
            color:#a6e3a1;
            font-weight: bolder;
            font-size: 20px;
            padding-left: 15px;
            padding-right: 15px;
        }

        @keyframes blink {
            to {
                background-color: #f9e2af;
                color:#96804e;
            }
        }

        #battery.critical:not(.charging) {
            background-color:  #f38ba8;
            color:#bf5673;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        label:focus {

        }

        #cpu {
            background: rgb(180,190,254);
            background: linear-gradient(52deg, rgba(180,190,254,1) 0%, rgba(137,220,235,1) 32%, rgba(137,180,250,1) 72%, rgba(166,227,161,1) 100%);
            background-size: 300% 300%;
            animation: gradient 20s ease infinite;
            text-shadow: 0 0 5px rgba(0, 0, 0, 0.377);
            /* background-color: #b4befe; */
            color: 	#fff;
        }

        #memory {
            background-color: #cba6f7;
            color: 	#9a75c7;
            font-weight: bolder;
        }

        #disk {
            color: #964B00;
        }

        #backlight {
            color: #90b1b1;
        }

        #network{
            color:#000;
        }

        #network.disabled{
            background-color: #45475a;
        }

        #network.disconnected{
            background: rgb(243,139,168);
            background: linear-gradient(45deg, rgba(243,139,168,1) 0%, rgba(250,179,135,1) 100%);
            color: #fff;
            font-weight: bolder;
            padding-top: 3px;
            padding-right: 11px;
        }

        #network.linked, #network.wifi{
            background-color: #a6e3a1 ;
        }

        #network.ethernet{
            background-color:#f9e2af ;
        }

        #wireplumber {
            background-color:  	#fab387;
            color: #bf7d54;
            font-weight: bolder;
        }

        #wireplumber.muted {
            background-color: #90b1b1;
        }

        #custom-media {
            color: #66cc99;
        }

        #custom-media.custom-spotify {
            background-color: #66cc99;
        }

        #custom-media.custom-vlc {
            background-color: #ffa000;
        }

        #temperature {
            background-color: #f9e2af;
            color:#96804e;
        }

        #temperature.critical {
            background-color: #f38ba8 ;
            color:#bf5673;
        }

        #tray {
            background-color: #2980b9;
        }

        #tray > .passive {
            -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
            -gtk-icon-effect: highlight;
            background-color: #eb4d4b;
        }

        #idle_inhibitor {
            background-color: #2d3436;
        }

        #idle_inhibitor.activated {
            background-color: #ecf0f1;
            color: #2d3436;
        }

        #mpd {
            background-color: #66cc99;
            color: #2a5c45;
        }

        #mpd.disconnected {
            background-color: #f53c3c;
        }

        #mpd.stopped {
            background-color: #90b1b1;
        }

        #mpd.paused {
            background-color: #51a37a;
        }

        #language {
            background: #00b093;
            color: #740864;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
        }

        #keyboard-state {
            background: #97e1ad;
            color: #000000;
            padding: 0 0px;
            margin: 0 5px;
            min-width: 16px;
        }

        #keyboard-state > label {
            padding: 0 5px;
        }

        #keyboard-state > label.locked {
            background: rgba(0, 0, 0, 0.2);
        }
        '';

        settings =[{
            "layer"= "bottom";
            "position"= "top";
            "height"= 50;
            "spacing"= 5;
            "margin-bottom"=-11;
            "modules-left" = ["hyprland/workspaces"];
            "modules-right" = ["network" "temperature" "wireplumber" "bluetooth" "memory" "clock"];
            "modules-center" = ["hyprland/window"];

            "hyprland/window" = {
                "separate-outputs"= true;

            };

            "custom/cycle_wall" = {
                "format" = "{}";
                "exec" = "~/.config/hypr/scripts/tools/expand wall";
                "on-click" = "~/.config/hypr/scripts/tools/expand cycle";
            };
            "custom/expand" = {
                "on-click" = "~/.config/hypr/scripts/expand_toolbar";
                "format" = "{}";
                "exec" = "~/.config/hypr/scripts/tools/expand arrow-icon";
            };

            "bluetooth" = {
            	"format" = " {status}";
            	"format-connected" = " {device_alias}";
            	"format-connected-battery" = " {device_alias} {device_battery_percentage}%";
            	"format-device-preference"= [ "device1" "device2" ];
            	"tooltip-format"= "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
            	"tooltip-format-connected"= "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            	"tooltip-format-enumerate-connected"= "{device_alias}\t{device_address}";
            	"tooltip-format-enumerate-connected-battery"= "{device_alias}\t{device_address}\t{device_battery_percentage}%";
            };

            "hyprland/workspaces" = {
                "format" = "{icon}";
                "format-active" = " {icon} ";
                "on-click" = "activate";
            };

            "clock"= {
                "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                "interval"= 60;
                "format"= "{:%I:%M}";
                "max-length"= 25;
            };
            "cpu"= {
                "interval"=1;
                "format"="{icon0} {icon1} {icon2} {icon3}";
                "format-icons"= ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
            };
            "memory"= {
                "format"= "{}% ";
            };
            "temperature"= {
                "critical-threshold"= 80;
                "format-critical"= "{temperatureC}°C";
                "format"= "{temperatureC}°C ";
            };
            "backlight"= {
                "format"= "{percent}% {icon}";
                "format-icons"= ["" "" "" "" "" "" "" "" ""];
            };

            "network" = {
                "interface" = "wlp2s0";
                "format" = "{ifname}";
                "format-wifi" = "{essid} ({signalStrength}%) ";
                "format-ethernet" = "{ipaddr}/{cidr} 󰊗";
                "format-disconnected" = "";
                "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
                "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
                "tooltip-format-ethernet" = "{ifname} ";
                "tooltip-format-disconnected" = "Disconnected";
                "max-length" = 50;
            };

            "wireplumber" = {
                "format" = "{volume}% {icon}";
                "format-muted" = "";
                "on-click" = "helvum";
                "format-icons" = ["" "" ""];
            };
            "custom/media"= {
                "format"= "{icon} {}";
                "return-type"= "json";
                "max-length"= 40;
                "format-icons"= {
                    "spotify"= "";
                    "default"= "🎜";
                };
                "escape"= true;
                "exec"= "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
            };
       }];
 };
}