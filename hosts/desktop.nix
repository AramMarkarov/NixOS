{ config, lib, pkgs, ... }:
{
  hardware.opengl = {
    enable = true;

  };

  services.xserver.videoDrivers = ["amdgpu"]; # Change for Nvidia/Intel

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 384000; # Change depending on hardware
      "default.clock.quantum" = 1024; # Increase by doubling if you encounter audio stutters
      "default.clock.min-quantum" = 512;
      "default.clock.max-quantum" = 512;
    };
  };
}
