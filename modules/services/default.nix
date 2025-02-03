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
    resolved = {
      enable = true;
      extraConfig = ''
        DNS=45.90.28.0#3122c2.dns.nextdns.io
        DNS=2a07:a8c0::#3122c2.dns.nextdns.io
        DNS=45.90.30.0#3122c2.dns.nextdns.io
        DNS=2a07:a8c1::#3122c2.dns.nextdns.io
        DNSOverTLS=yes
      '';

};
    ollama = {
      enable = true;
      acceleration = "rocm";
      environmentVariables = {
        HCC_AMDGPU_TARGET = "gfx90";
      };
      rocmOverrideGfx = "9.0";
    };
    btrfs.autoScrub = {
        enable = true;
        interval = "weekly";
        fileSystems = [ "/" ];
    };
    upower.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;
    tailscale.enable = false;
    printing.enable = true;
    xserver = {
        enable = true;
        };
    displayManager.sddm.theme = "rose-pine";
    displayManager.sddm.enable = true;
    flatpak.enable = true;
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
