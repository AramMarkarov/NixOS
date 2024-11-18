{
  description = "Nixos config flake with Home-Manager, Hyprland, and HyprPanel";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";  # Nixpkgs version
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
        };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";  # HyprPanel input (without `/nix`)
    hyprland.url = "github:hyprwm/Hyprland";  # Hyprland input
  };

  outputs = inputs @ {self, nixpkgs, home-manager, hyprpanel, hyprland, ... }:

  let
    system = "x86_64-linux";  # Define the system architecture
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    # Home Manager configuration for user-specific setup
    homeConfigurations."aramjonghu@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs =  nixpkgs.legacyPackages.x86_64-linux
                import nixpkgs {
                inherit system;
                overlays = [
                    inputs.hyprpanel.overlay
                    ];
                };
        extraSpecialArgs = { inherit system inputs; };
      modules = [
        ./home/home.nix  # Include the home.nix file for user-specific configurations
                  {
                  wayland.windowManager.hyprland = {
                    enable = true;
                    # set the flake package
                    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
                        };
                    }
                ];
            };
      };
}
