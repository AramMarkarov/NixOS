# NixOS

**Please note that if you wish to copy parts of the config, please adjust relevant parts such as monitor resolutions to avoid issues.**

This is my nixos github page containing nix files. These will make up my laptop and desktop setups.
For newer users, note that you need to keep your own hardware-configuration.nix file. Also you will need to enable flakes and install home-manager before you are able to `sudo rebuild-switch --flake .#nixos`. I might also be missing some required packages to let it download in one go

This is the base configuration for my desktop. Periodically I will update this branch to the master branch.

# Things that need fixing
* LACT daemon 
* Firefox extensions autoadd using nix
* Pref. osu winello auto cloning (when its not cloned yet) and autocreate a .desktop file (if not done so yet)
* Spicetify currently not working in nix
