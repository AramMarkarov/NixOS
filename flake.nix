{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
        solaar.url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz";
    };

    outputs = inputs @ { nixpkgs, self, solaar, ... }: let
        system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit inputs;
                inherit system;
            };
            modules = [
                ./configuration.nix
                { nixpkgs.overlays = [ inputs.hyprpanel.overlay ]; }
                solaar.nixosModules.default
            ];
        };
    };
}
