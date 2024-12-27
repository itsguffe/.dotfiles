{

  description = "System flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixvim.url = "github:itsguffe/nixvim/main";
  };
  outputs = { self, nixpkgs,  ... }@attrs :
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixter = lib.nixosSystem {
          inherit system;
	  specialArgs = attrs;
          modules = [./hosts/main/configuration.nix];
        };
        maxter = lib.nixosSystem {
          inherit system;
	  specialArgs = attrs;
          modules = [./hosts/mac/configuration.nix];
        };
        nixters-lab = lib.nixosSystem {
          inherit system;
          modules = [./hosts/homeserver/configuration.nix];
        };
      };
    };
}
