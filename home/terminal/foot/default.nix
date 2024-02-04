{ pkgs, ... }: {
  home.packages = [ pkgs.foot ];

  xdg.configFile."food/foot.ini".source = ./foot.ini;
}
