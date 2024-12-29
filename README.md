# NixOS

**Please note that if you wish to copy parts of the config, please adjust relevant parts such as monitor resolutions to avoid issues.**

This is my nixos github page containing nix files. These will make up my laptop and desktop setups.
For newer users, note that you need to keep your own hardware-configuration.nix file. Also you will need to enable flakes and install home-manager before you are able to `sudo rebuild-switch --flake .#nixos`. I might also be missing some required packages to let it download in one go

This is the base configuration for my desktop. Periodically I will update this branch to the master branch.

# Things that need fixing
* swww-daemon background in nix config
* LACT daemon 
* Firefox extensions autoadd using nix
* Hyprpanel is currently not working since the migration
  * Hyprpanel can be configured using nix
* Hyprland declaration can be improved to be declared instead of the full config in plain text
* Steam gamescope can be attempted
* Pref. osu winello auto cloning (when its not cloned yet) and autocreate a .desktop file (if not done so yet)
* OSprober is currently broken
* Spicetify currently not working in nix
* Some steam games do not work
  * Elden Ring (known EAC issue)
  * Baldur's gate 3 larian launcher launches but the game does not show up

