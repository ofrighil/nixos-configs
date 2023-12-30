{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  sound.enable = true;

  security.rtkit.enable = true;

  # for sway
  security.polkit.enable = true;
  hardware.opengl.enable = true;

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };

  # virtualisation.docker.enable = true;

  environment.systemPackages = (with pkgs; [
    xclip # refactor later
    gnumake
    postgresql_15
  ]);

  xdg.portal = {
    config.common.default = "*";
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "23.11";
}
