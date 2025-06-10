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

  services.xserver.videoDrivers = ["amdgpu"];
  boot.initrd.kernelModules = ["amdgpu"];
}
