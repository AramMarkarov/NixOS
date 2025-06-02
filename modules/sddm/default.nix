{ config, lib, pkgs, ... }:
{

displayManager.sddm = {
  enable = true;
  theme = "catppuccin-macchiato";
  package = pkgs.kdePackages.sddm;
};

}
