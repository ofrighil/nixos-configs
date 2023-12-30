let
  packages = ps: with ps; [
    python-lsp-server
    ruff-lsp
  ];
in pkgs: [ (pkgs.python311.withPackages packages) ]
