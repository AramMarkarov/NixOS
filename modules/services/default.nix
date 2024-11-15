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

  # Network
  networking.networkmanager.enable = true;
  systemd.services.resolved = {
    environment = {
      DNSOverTLS = "yes";
    };
  };
}
