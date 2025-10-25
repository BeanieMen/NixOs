{
  description = "Your NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, flake-utils, ... }:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      mkHost = host:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit self inputs host; };

           modules = [
            ./modules/bootloader.nix
            ./modules/font.nix

            {
              nixpkgs = {
                config.allowUnfree = true;
                overlays = [ overlay-unstable ];
              };
            }

 

            ./hosts/${host}/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;

              home-manager.users.aj = {
                imports = [ ./hosts/${host}/home-manager/home.nix ];
              };
            }
          ];

        };
    in { nixosConfigurations = { Beanie = mkHost "Beanie"; }; };
}
