{ pkgs, ... }: {
  home.packages = [ 
    pkgs.neovim
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  ];

  xdg.configFile."nvim/init.lua" = { source = ./nvim/init.lua; };
  xdg.configFile."nvim/after" = { source = ./nvim/after; };
  xdg.configFile."nvim/lua" = { source = ./nvim/lua; };
}
