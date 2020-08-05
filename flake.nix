{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.03";
  outputs = { self, nixpkgs }: {
    nixosConfigurations.pp-ws-dbe = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixpkgs.nixosModules.notDetected
        ./nixos/etc/nixos/configuration.nix
      ];
    };
  };
}