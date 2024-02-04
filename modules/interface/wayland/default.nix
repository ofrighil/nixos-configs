{ pkgs, ... }: {
  imports = [ (import ./display.nix pkgs) ];

  hardware.opengl.enable = true;
  security.polkit.enable = true;
  services.dbus.enable = true;

  environment.systemPackages = with pkgs; [ 
    dbus
    # fuzzel
    grim
    # mako
    slurp
    # swaybg
    # swayidle
    # swaylock
    qt6.qtwayland
    # waybar
    wl-clipboard
    # xdg-utils
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
