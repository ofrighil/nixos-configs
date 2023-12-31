{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs;
    agenix.url = github:ryantm/agenix;
    home-manager.url = github:nix-community/home-manager;

    rust-overlay.url = github:oxalica/rust-overlay;
  };

  outputs = inputs: let
    inherit (import ./tools.nix inputs) mkSystem;
  in {
    nixosConfigurations.serval = mkSystem {
      system = "x86_64-linux";
      interface = "wayland";
      username = "ofrighil";
      hostname = "serval";
    };
  };
}
