{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.ofrighil = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/ofrighil";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  networking.hostName = "serval";
  networking.networkmanager.enable = true;

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

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    firefox
    git
    ripgrep
    bat
    fd
    xclip # refactor later
    rust-analyzer
    lua-language-server
    lld_16
    clang
    python311
    python311Packages.python-lsp-server
    gnumake
    gcc
    ocaml
    ocamlPackages.ocaml-lsp
    opam
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
