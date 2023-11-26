{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../services
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.ofrighil = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/ofrighil";
    extraGroups = [ "docker" "wheel" "networkmanager" ];
    shell = pkgs.nushell;
  };

  environment.shells = with pkgs; [ nushell zsh ];

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

  # for sway
  security.polkit.enable = true;
  hardware.opengl.enable = true;

  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;
  # services.postgresql.enable = true;

  environment.systemPackages = (with pkgs; [
    firefox
    git
    ripgrep
    bat
    fd
    vim
    xclip # refactor later
    rust-analyzer
    lua-language-server
    lld_16
    clang
    gnumake
    gcc
    ocaml
    ocamlPackages.ocaml-lsp
    opam
    postgresql_15
  ]) ++ (import ../../languages pkgs);

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "23.05";
}
