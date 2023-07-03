{ pkgs, ... }: {
  home.packages = [ pkgs.neovim ];

  programs.neovim.plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];

  xdg.configFile."nvim/" = { source = ./nvim; };
}
