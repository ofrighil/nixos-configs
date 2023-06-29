{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.ofrighil = {
    isNormalUser = true;
    uid = 6349;
    home = "/home/ofrighil";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  networking.hostName = "serval";
  networking.networkmanager.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  sound.enable = true;

  security.rtkit.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [ pkgs.zsh ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    firefox
    neovim
    git
    ripgrep
  ];

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "23.05";
}
