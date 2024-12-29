{ config, lib, pkgs, ... }:

{
  # bluetooth
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.enable = true;

  services = {
    btrfs.autoScrub = {
        enable = true;
        interval = "weekly";
        fileSystems = [ "/" ];
    };
    blueman.enable = true;
    upower.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;
    tailscale.enable = false; # only enable when streaming or viewing stream
    xserver.enable = true;
    displayManager.sddm.enable = true;
    flatpak.enable = true;
  };

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Network
  networking.networkmanager.enable = true;
  systemd.services.resolved = {
    environment = {
      DNSOverTLS = "yes";
    };
  };
  
}
