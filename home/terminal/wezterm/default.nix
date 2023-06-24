{ pkgs, ... }: {
  home.packages = [ pkgs.wezterm ];

  xdg.configFile."wezterm/wezterm.lua".text = ''
    return {
      window_frame = {
        font_size = 14.0,
      }
    }
  '';
}
