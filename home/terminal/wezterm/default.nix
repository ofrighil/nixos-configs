{ pkgs, ... }: {
  home.packages = [ pkgs.wezterm ];
  xdg.configFile."wezterm/wezterm.lua".text = ''
    local wezterm = require('wezterm')
    return {
      font = wezterm.font(
        "MonoLisa Ligature",
        { weight="Regular", stretch="Normal", style="Normal" }
      ),
      font_size = 14.0,
    }
  '';
}
