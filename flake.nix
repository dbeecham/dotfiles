{

  # updated 2020-10-12
  inputs.nixpkgs = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "eba1d0126b4e6c386d529911bbeadbea99b933d6";
  };
  inputs.rip = {
    type = "github";
    owner = "nivekuil";
    repo = "rip";
    rev = "8b9514f841cf596ff6c2f1a7cc8f8df037c4a1b0";
    flake = false;
  };
  inputs.pdotfiles = {
    type = "git";
    url = "git+ssh://git@github.com/dbeecham/p-dotfiles";
    rev = "396e0205289dd2b3912520138ad5061bb5b9d3b7";
  };

  outputs = inputs@{ self, nixpkgs, rip, pdotfiles }: rec {

    nixosConfigurations.pp-ws-dbe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/etc/nixos/configuration.nix (inputs // { local = packages.x86_64-linux; } ) )
        pdotfiles.nixosModules.prodhosts
      ];
    };

    nixosConfigurations.doppy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/doppy/configuration.nix (inputs // { local = packages.x86_64-linux; } ))
      ];
    };


    packages.x86_64-linux = let pkgs = (import nixpkgs { system = "x86_64-linux"; }); in {

      rip = pkgs.rustPlatform.buildRustPackage {
        pname = "rm-improved";
        version = "8b9514f841cf596ff6c2f1a7cc8f8df037c4a1b0";
        src = rip;
        cargoSha256 = "XaqheiJMP3K2wDrIKz54NK8TRft8+SufYACc8XHvjWQ=";
        verifyCargoDeps = true;
      };

    };

  };
}
