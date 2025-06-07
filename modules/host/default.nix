{ config, lib, pkgs, ... }:

{

systemd.tmpfiles.rules = 
  let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];

  hardware = {
      graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = with pkgs; [
            amdvlk clinfo mesa libdrm  
            rocmPackages.clr.icd rocmPackages.rocm-runtime
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
    "video=DP-1:2560x1440@165"
  ];
}
