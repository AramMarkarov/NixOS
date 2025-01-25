{ config, lib, pkgs, ... }:
{
  hardware = {
      graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = with pkgs; [
            amdvlk clinfo mesa libdrm #rocmPackages.clr.icd Temporarily disabled
          ];
        };
  };

  services.xserver.videoDrivers = ["amdgpu"]; # Change for Nvidia/Intel
  boot.initrd.kernelModules = [ "amdgpu" ];

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 64;
      "default.clock.min-quantum" = 64;
      "default.clock.max-quantum" = 64;
    };
  };

  boot.kernelParams = [
    "video=DP-1:2560x1440@60"
    "video=DP-2:2560x1440@60"
  ];
}
