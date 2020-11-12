{

  # updated 2020-10-12
  inputs.nixpkgs = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "d2b8b928655f1b5e80985e49555aef70818a9bdf";
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
    rev = "ed45ce51262b51494b70878037a411b7db48f2a3";
  };
  inputs.st = {
    type = "github";
    owner = "dbeecham";
    repo = "st";
    rev = "77f6af60b98c6f264f78f6feeae13150fd28e3f0";
  };

  outputs = inputs@{ self, nixpkgs, rip, pdotfiles, ... }: rec {

    nixosConfigurations.pp-ws-dbe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/etc/nixos/configuration.nix (inputs // { st = inputs.st; local = packages.x86_64-linux; } ) )
        pdotfiles.nixosModules.prodhosts
      ];
    };

    nixosConfigurations.doppy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/doppy/configuration.nix (inputs // { local = packages.x86_64-linux; } ))
        pdotfiles.nixosModules.prodhosts
      ];
    };


    packages.x86_64-linux = let pkgs = (import nixpkgs { system = "x86_64-linux"; }); in {

      rip = pkgs.rustPlatform.buildRustPackage {
        pname = "rm-improved";
        version = "8b9514f841cf596ff6c2f1a7cc8f8df037c4a1b0";
        src = rip;
        cargoSha256 = "HBRXlaCyXp7Mc68D296fuDpCdoa2H31Ze8XrE+8O12g=";
        verifyCargoDeps = true;
      };

      fonts = pkgs.stdenv.mkDerivation {
        name = "fonts";
        src = ./fonts;
        nativeBuildInputs = [ pkgs.xorg.mkfontdir ];
        installPhase = ''
          ls
          install -m 644 -D .fonts/Hack/*ttf -t $out/share/fonts
          mkfontdir $out/share/fonts
        '';
      };

    };

  };
}
