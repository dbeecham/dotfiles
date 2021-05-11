{

  # updated 2021-05-03
  inputs.nixpkgs = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "7c679678d6fd5e9b6a37155fa7b66228341dc4fa";
  };
  inputs.rip = {
    type = "github";
    owner = "nivekuil";
    repo = "rip";
    rev = "11f0b8d018975f78d922038efc7f60bf9fffafd0";
    flake = false;
  };
  inputs.dog = {
    type = "github";
    owner = "ogham";
    repo = "dog";
    rev = "640818d36e7ed04e2666aba90d0c037787cb9d6c";
    flake = false;
  };
  inputs.pdotfiles = {
    type = "git";
    url = "git+ssh://git@github.com/dbeecham/p-dotfiles";
    rev = "830520148c28c7151243e2f1875e6906b895c81e";
  };
  inputs.st = {
    type = "github";
    owner = "dbeecham";
    repo = "st";
    rev = "77f6af60b98c6f264f78f6feeae13150fd28e3f0";
  };

  outputs = inputs@{ self, nixpkgs, rip, dog, pdotfiles, ... }: rec {

    nixosModules.dbe = (import ./nixos/users/dbe.nix (inputs // { st = inputs.st; local = packages.x86_64-linux; }));

    nixosConfigurations.pp-ws-dbe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/pp-ws-dbe/configuration.nix (inputs // { st = inputs.st; local = packages.x86_64-linux; } ) )
        pdotfiles.nixosModules.prodhosts
        pdotfiles.nixosModules.pam_rules
        pdotfiles.nixosModules.pp_ws_dbe
        self.nixosModules.dbe
      ];
    };

    nixosConfigurations.doppy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/doppy/configuration.nix (inputs // { local = packages.x86_64-linux; } ))
        pdotfiles.nixosModules.prodhosts
        #pdotfiles.nixosModules.pam_rules
        pdotfiles.nixosModules.doppy
        self.nixosModules.dbe
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

      dog = nixpkgs.legacyPackages.x86_64-linux.rustPlatform.buildRustPackage {
        name = "dog";
        version = "f756c6769dbdea0661a0ed074568d935f62b3b89";
        src = dog;
        nativeBuildInputs = with nixpkgs.legacyPackages.x86_64-linux; [ pkgconfig ];
        buildInputs = with nixpkgs.legacyPackages.x86_64-linux; [ openssl ];
        cargoSha256 = "F/cZUVoaGfsQDyzdT2D6fphCetFPfPcLc64HMNsDhCs=";
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
