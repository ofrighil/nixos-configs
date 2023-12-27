{ username, hostname }: { pkgs, ... }: let
  home = "/home/${username}";
in {
  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    uid = 1000;
    inherit home;
    extraGroups = [ "docker" "wheel" "networkmanager" ];
    shell = pkgs.nushell;
  };

  programs.neovim.defaultEditor = true;

  age.identityPaths = [ "${home}/.ssh/fonts-key" ];

  environment.systemPackages = [ pkgs.vim ];
}
