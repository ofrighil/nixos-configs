{ pkgs, ... }: {
  imports = [ ./display.nix ./window.nix ];

  environment.systemPackages = [ pkgs.xclip ];
}
