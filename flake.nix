{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";      
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations."${host}" = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit system;
        inherit inputs;
      };
      modules = [
        {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
      ];
    };
  };
}
