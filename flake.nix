{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  inputs.local = {
    type = "indirect";
    id = "local";
  };
  outputs = inputs@{ self, nixpkgs, local }: {

    nixosConfigurations.pp-ws-dbe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        (import ./nixos/etc/nixos/configuration.nix inputs)
      ];
    };

  };
}
