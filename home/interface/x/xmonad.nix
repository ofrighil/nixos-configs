{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  xdg.configFile."xmonad/xmonad.hs".text = ''
    import XMonad

    main = xmonad defaultConfig {
      terminal = "wezterm"
    }
  '';
}
