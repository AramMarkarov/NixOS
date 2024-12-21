{ config, lib, pkgs, ... }:

{
  # bluetooth
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services = {
    upower.enable = true;
    fwupd.enable = true;
    tailscale.enable = true;
    printing.enable = true;
    xserver = {
        enable = true;
        };
    displayManager.sddm.enable = true;
  };
  # Network
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = true;

  systemd.services.resolved = {
    environment = {
      DNSOverTLS = "yes";
    };
  };
}
