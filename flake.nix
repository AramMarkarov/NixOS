{
  description = "Nixos config flake with Home-Manager, Hyprland and HyprPanel";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";  # Nixpkgs version
    home-manager.url = "github:nix-community/home-manager";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";  # HyprPanel input
    hyprland.url = "github:hyprwm/Hyprland";  # Hyprland input
  };

  outputs = { self, nixpkgs, home-manager, hyprpanel, hyprland, ... }@inputs: let
    system = "x86_64-linux";  # Define the system architecture
  in {
    # Home Manager configuration (for user-specific setup)
    homeConfigurations."aramjonghu@nixos" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          inputs.hyprpanel.overlay  # Include HyprPanel overlay
          inputs.hyprland.overlay   # Include Hyprland overlay
        ];
      };
      extraSpecialArgs = { inherit system; inherit inputs; };
      modules = [
        # Example user configuration for Hyprland
        {
          wayland.windowManager.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          };
        }
        # Optionally add HyprPanel package to the user's environment
        {
          home.packages = [
            pkgs.hyprpanel  # Install HyprPanel for the user
          ];
        }
        # Include any other modules or user configurations here
      ];
    };
  };
}
