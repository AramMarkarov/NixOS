{ config, lib, pkgs, ... }:

{
# bluetooth
    hardware.bluetooth.powerOnBoot = true;
    hardware.bluetooth.enable = true;

    services = {
        solaar = {
            enable = true;
            package = pkgs.solaar;
            window = "hide";
            batteryIcons = "regular";
            extraArgs = "";
        };
        gvfs.enable = true;
        ollama = {
            enable = true;
            acceleration = "rocm";
        };
        btrfs.autoScrub = {
            enable = true;
            interval = "weekly";
            fileSystems = [ "/mnt/HDD" ];
        };
        blueman.enable = true;
        upower.enable = true;
        udisks2.enable = true;
        fwupd.enable = true;
        xserver.enable = true;
        displayManager.sddm = {
            enable = true;
            theme = "rose-pine";
        };
        printing.enable = true; 
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
