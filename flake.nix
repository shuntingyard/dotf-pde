{
  description = "Basic nixvim config for personalized development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Just for formatting
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim
    , flake-parts
    , ...
    } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs
        , system
        , ...
        }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config; # import the module directly
            extraSpecialArgs = {
              # inherit (inputs) foo;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          # to run `nix flake check .`
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          # run `nix run .` to start nixvim
          packages = {
            default = nvim;
          };

          # run `nix fmt`
          formatter = pkgs.nixpkgs-fmt;
        };

      # Global flake outputs
      flake = {
        homeManagerModules = {
          default = {
            imports = [
              inputs.nixvim.homeModules.nixvim
              ./modules/home_manager.nix
            ];
          };
        };
        nixosModules = {
          ohbrother = ./modules/nixos.nix;
        };
      };
    };
}
