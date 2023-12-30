{ pkgs, ... }: {
  imports = [ ./display.nix ./window.nix ];

  environment.systemPackages = [ pkgs.xclip ];

  xdg.portal = {
    config.common.default = "gtk";
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
