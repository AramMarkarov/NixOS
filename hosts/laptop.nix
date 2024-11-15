{ config, lib, pkgs, ... }:
{
  networking.hostName = "desktop"; # Ensure hostname matches your actual desktop hostname

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"]; # Change for Nvidia/Intel

  sound.enable = true;
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 96000;
      "default.clock.quantum" = 2048;
      "default.clock.min-quantum" = 1024;
      "default.clock.max-quantum" = 1024;
    };
  };
}
