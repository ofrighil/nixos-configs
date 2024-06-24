{
  description = "My portable environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
    rust-overlay = {
        url = "github:oxalica/rust-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (
      system:
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs {
            inherit system overlays;
          };
        in {
          devShells.default = with pkgs; mkShell {
            buildInputs = [ 
              bat
              eza
              fd
              git
              lua-language-server
              gnumake
              neovim
              nil
              ocaml
              ocamlPackages.ocaml-lsp
              opam
              ripgrep
              rust-analyzer
              rust-bin.stable.latest.default
              tmux
            ];

            shellHook = ''
              alias cat=bat
              alias find=fd
              alias ls=eza
            '';
          };
        }
    );
}
