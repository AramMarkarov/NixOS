{ config, lib, pkgs, ... }:

{
  # bluetooth
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.enable = true;

  services = {
    ollama = {
      enable = true;
      acceleration = "rocm";
      environmentVariables = {
        HCC_AMDGPU_TARGET = "gfx1031";
      };
      rocmOverrideGfx = "10.3.1";
    };
    btrfs.autoScrub = {
        enable = true;
        interval = "weekly";
        fileSystems = [ "/" "/mnt/HDD" ];
    };
    blueman.enable = true;
    upower.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;
    tailscale.enable = false; # only enable when streaming or viewing stream
    xserver.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.theme = "rose-pine";
    flatpak.enable = true;
  };

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
  };
  nix.settings.auto-optimise-store = true;

  # Network
  networking.networkmanager.enable = true;
  systemd.services.resolved = {
    environment = {
      DNSOverTLS = "yes";
    };
  };
  
}
