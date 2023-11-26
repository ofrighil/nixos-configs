{ pkgs, ... }: {
  home.packages = [ pkgs.hyprland pkgs.kitty ];

  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf;
}
