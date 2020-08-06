{
  inputs.rip = {
    type = "github";
    owner = "nivekuil";
    repo = "rip";
    rev = "8b9514f841cf596ff6c2f1a7cc8f8df037c4a1b0";
    flake = false;
  };
  outputs = { self, nixpkgs, rip }: {
    packages.x86_64-linux.rip = (import nixpkgs { system = "x86_64-linux"; }).rustPlatform.buildRustPackage {
      pname = "rm-improved";
      version = "8b9514f841cf596ff6c2f1a7cc8f8df037c4a1b0";
      src = rip;
      cargoSha256 = "HBRXlaCyXp7Mc68D296fuDpCdoa2H31Ze8XrE+8O12g=";
      verifyCargoDeps = true;
    };
  };
}
