{ pkgs, ... }: {
  imports = [ ./display.nix ];

  security.polkit.enable = true;
  hardware.opengl.enable = true;

  environment.systemPackages = [ pkgs.wl-clipboard ];

  xdg.portal = {
    config.common.default = "wlr";
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
    ];
  };
}
