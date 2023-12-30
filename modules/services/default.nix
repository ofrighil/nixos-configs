{ pkgs, ... }: {
  imports = [ ./multimedia.nix ./x ];

  xdg.portal = {
    config.common.default = "gtk";
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
