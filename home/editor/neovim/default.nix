{ pkgs, ... }: {
  home.packages = [ 
    pkgs.neovim
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  ];

  xdg.configFile."nvim/" = { source = ./nvim; };
}
