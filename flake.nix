{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  inputs.rip = {
    type = "github";
    owner = "nivekuil";
    repo = "rip";
    rev = "8b9514f841cf596ff6c2f1a7cc8f8df037c4a1b0";
    flake = false;
  };

  outputs = inputs@{ self, nixpkgs, rip }: rec {

    nixosConfigurations.pp-ws-dbe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/etc/nixos/configuration.nix (inputs // { local = packages.x86_64-linux; } ) )
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

      mdnsresponder = pkgs.stdenv.mkDerivation {
        name = "mdnsresponder";
        src = ./nixpkgs/mDNSResponder-1096.40.7.tar.gz;
        buildPhase = ''
          cd mDNSPosix && make os=linux
        '';
        installPhase = ''
          mkdir $out;
          mkdir $out/lib;
          mkdir $out/bin;
          cp build/prod/libdns_sd.so $out/lib/;
          cp build/prod/libnss_mdns-0.2.so $out/lib/;
          cp build/prod/mDNSClientPosix $out/bin/;
          cp build/prod/mdnsd $out/bin/;
          cp build/prod/mDNSNetMonitor $out/bin/;
          cp build/prod/mDNSProxyResponderPosix $out/bin/;
          cp build/prod/mDNSResponderPosix $out/bin/;
        '';
      };
    };

  };
}
