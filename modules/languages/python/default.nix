let
  packages = ps: with ps; [
    isort
    python-lsp-ruff
    python-lsp-server
  ];
in pkgs: with pkgs; [ (python311.withPackages packages) ruff ]
