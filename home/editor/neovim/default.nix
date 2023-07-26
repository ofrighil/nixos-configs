{ pkgs, ... }: {
  home.packages = [ pkgs.neovim ]; #pkgs.gcc ];

  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];

  xdg.configFile."nvim/" = { source = ./nvim; };
}
