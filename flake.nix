{

  description = "System flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };
  outputs = { self, nixpkgs,  ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixter = lib.nixosSystem {
          inherit system;
          modules = [./hosts/main/configuration.nix];
        };
        maxter = lib.nixosSystem {
          inherit system;
          modules = [./hosts/mac/configuration.nix];
        };
        nixters-lab = lib.nixosSystem {
          inherit system;
          modules = [./hosts/homeserver/configuration.nix];
        };
      };
    };
}
