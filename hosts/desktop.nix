{ config, lib, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"]; # Change for Nvidia/Intel

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000; # Change depending on hardware
      "default.clock.quantum" = 32; # Increase by doubling if you encounter audio stutters
      "default.clock.min-quantum" = 32;
      "default.clock.max-quantum" = 32;
    };
  };

}
