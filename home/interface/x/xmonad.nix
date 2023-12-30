{
  xdg.configFile."xmonad/xmonad.hs".text = ''
    import XMonad

    main = xmonad defaultConfig {
      terminal = "wezterm"
    }
  '';
}
