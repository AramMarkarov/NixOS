{
  description = "Nixos config flake with Home-Manager, Hyprland, and HyprPanel";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-24.05";  # Nixpkgs version
    home-manager.url = "github:nix-community/home-manager";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";  # HyprPanel input (without `/nix`)
    hyprland.url = "github:hyprwm/Hyprland";  # Hyprland input
  };

  outputs = { self, nixpkgs, home-manager, hyprpanel, hyprland, ... }@inputs: let
    system = "x86_64-linux";  # Define the system architecture
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        allowBroken = true;
        allowUnsupportedSystem = true;
      };
      overlays = [
        inputs.hyprpanel.overlay
      ];
    };
  in {
    # Nixos configuration for the host system
    nixosConfigurations."aramjonghu" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix  # Include the main NixOS configuration for Hyprland
      ];
    };

    # Home Manager configuration for user-specific setup
    homeConfigurations."aramjonghu@nixos" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;  # Pass pkgs to Home Manager
      extraSpecialArgs = { inherit system inputs; };
      modules = [
        ./home/home.nix  # Include the home.nix file for user-specific configurations
      ];
    };
  };
}
