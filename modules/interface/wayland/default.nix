{ pkgs, ... }: {
  imports = [ (import ./display.nix pkgs) ]

  security.polkit.enable = true;
  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [ 
    wl-clipboard
    qt6.qtwayland
  ];

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
