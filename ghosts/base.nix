{ username, hostname }: { pkgs, ... }: let
  home = "/home/${username}";
in {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.users.${username} = {
    isNormalUser = true;
    uid = 1000;
    inherit home;
    extraGroups = [ "docker" "wheel" "networkmanager" ];
    shell = pkgs.nushell;
  };

  environment.shells = with pkgs; [ nushell zsh ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [ 
    bat
    clang
    clang-tools_17
    cmake
    fd
    firefox
    gcc
    git
    lld_16
    ripgrep
    vim
  ];

  age.identityPaths = [ "${home}/.ssh/fonts-key" ];
}
