{ config, pkgs, ... }:

{
  home.username = "yutatsu";
  home.homeDirectory = "/Users/yutatsu";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.htop
    pkgs.fd
    pkgs.silver-searcher
    pkgs.tldr
    pkgs.mise
    pkgs.neovim
    pkgs.bat
  ];

  home.shellAliases = {
    v = "nvim";
    diff = "nvim -d ";
    cat = "bat";
  };

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    envExtra = ''
      		export XDG_CONFIG_HOME=~/dotfiles/.config
      	'';
    enable = true;
    autosuggestion.enable = true;
    # dotDir = "~/dotfiles/.config"
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" "vi-mode" "copyfile" ];
      theme = "minimal";
    };
  };

  programs.tmux = {
    enable = true;
  };

  programs.mise = {
    enable = true;
    globalConfig = {
      tools = {
        node = "latest";
        python = "latest";
        rust = "latest";
        go = "latest";
        haskell = "latest";
        lua = "latest";
      };
    };
  };
}
