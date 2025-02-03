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
  boot.initrd.kernelModules = ["amdgpu"];

  services.tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
          CPU_ENERGY_PERF_POLICY_ON_AC = "default";

          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 90;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 80;

         START_CHARGE_THRESH_BAT0 = 30;
         STOP_CHARGE_THRESH_BAT0 = 90;
        };
  };
}
