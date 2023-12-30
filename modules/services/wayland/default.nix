{ pkgs, ... }: {
  imports = [ ./display.nix ];

  security.polkit.enable = true;
  hardware.opengl.enable = true;

  environment.systemPackages = [ pkgs.wl-clipboard ];

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
  ];
}
