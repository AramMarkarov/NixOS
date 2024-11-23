{
  description = "Nixos config flake with Home-Manager, Hyprland, and HyprPanel";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-24.05";
    home-manager = {
        url = "github:nix-community/home-manager/release-24.05";
        inputs.nixpkgs.follows = "nixpkgs";
        };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ {self, nixpkgs, home-manager, hyprpanel, hyprland, ... }:

  let
    system = "x86_64-linux";  # Define the system architecture
    pkgs = import nixpkgs {
                config = { allowUnfree = true;
                           allowBroken = true;
                           };
           inherit system;
    };
  in {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
	inherit system;
	modules = [
		./configuration.nix
		];
		specialArgs = {inherit inputs pkgs;};
	};

    homeConfigurations."aramjonghu" = home-manager.lib.homeManagerConfiguration {
        pkgs =  import nixpkgs {
                config = { allowUnfree = true;
                           allowBroken = true;
                           };
                inherit system;
                overlays = [
                    inputs.hyprpanel.overlay
                    ];
                };
        extraSpecialArgs = { inherit system inputs; };
        modules = [
            ./home/home.nix
            {
                wayland.windowManager.hyprland = {
                enable = true;
                package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
                        };
                }
            ];
        };
    };
}
