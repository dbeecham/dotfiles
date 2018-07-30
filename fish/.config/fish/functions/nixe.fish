function nixe
    nix-env -f ~/nixpkgs -j 5 --cores 4 --option extra-binary-caches http://hydra.nixos.org --option extra-binary-caches http://hydra.cryp.to $argv
end
