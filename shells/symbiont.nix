{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    nativeBuildInputs = with pkgs; [ 
      git
      neovim
      rustc
      rustup
      rust-analyzer
      cargo
      postgresql
      lapce
      tmux
      neovim-remote
      ripgrep
      openssl
      nodejs
      protobuf3_20
      vimPlugins.nvim-treesitter.withAllGrammars

      lua-language-server

      clang

      python311
      python311Packages.python-lsp-server

      ocaml
      ocamlPackages.ocaml-lsp
      opam

      nushell
    ];

    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

    shellHook =
    ''
      nu
    '';
}
