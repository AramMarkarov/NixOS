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
        tlp = {
            enable = true;
            settings = {
                CPU_SCALING_GOVERNOR_ON_AC = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
                CPU_ENERGY_PERF_POLICY_ON_AC = "default";

                CPU_MIN_PERF_ON_AC = 0;
                CPU_MAX_PERF_ON_AC = 92;
                CPU_MIN_PERF_ON_BAT = 0;
                CPU_MAX_PERF_ON_BAT = 85;

                START_CHARGE_THRESH_BAT0 = 30;
                STOP_CHARGE_THRESH_BAT0 = 90;
            };
        };
    };

# Garbage collection
    nix.gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 3d";
    };
    nix.settings.auto-optimise-store = true;

# Network
    networking = {
        networkmanager.enable = true;
        nameservers = [ "45.90.28.137" "45.90.30.137" ];
    };
    systemd.services.resolved = {
        environment = {
            DNSOverTLS = "yes";
        };
    };
}
