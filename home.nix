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
    pkgs.hackgen-nf-font
    pkgs.tailscale
    pkgs.wget
    pkgs.haskellPackages.hoogle
  ];

  # auto load fonts installed via home-manager
  fonts.fontconfig.enable = true;

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

  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ~/dotfiles/.config/wezterm/wezterm.lua;
  };

  programs.zsh = {
    envExtra = ''
            		export XDG_CONFIG_HOME=~/dotfiles/.config
      					. ~/.ghcup/env
            	'';
    enable = true;
    autosuggestion.enable = true;
    # dotDir = "~/dotfiles/.config"
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" "vi-mode" "copyfile" ];
      theme = "af-magic";
    };
    plugins = [
      {
        name = "H-S-MW";
        src = pkgs.fetchFromGitHub {
          owner = "z-shell";
          repo = "H-S-MW";
          rev = "v1.0.0";
          sha256 = "1d8yg38d2b9dd331yrdp8lj5qr6winr2vmdnc54c7nn8hz4n341n";
        };
      }
    ];
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ~/dotfiles/.tmux.conf;
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
