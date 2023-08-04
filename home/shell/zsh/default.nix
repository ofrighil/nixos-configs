{ pkgs, ... }: {
  programs.zsh.enable = true;

  home.file.".zshrc".text = ''
    HISTFILE=~/.histfile
    HISTSIZE=1000
    SAVEHIST=1000
    bindkey -e
    # End of lines configured by zsh-newuser-install
    # The following lines were added by compinstall
    zstyle :compinstall filename '/home/ofrighil/.zshrc'

    autoload -Uz compinit
    compinit
    # End of lines added by compinstall
  '';

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
