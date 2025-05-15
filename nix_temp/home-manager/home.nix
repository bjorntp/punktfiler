{ lib, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./kitty.nix
    ./ssh.nix
    ./git.nix
    ./ranger.nix
  ];
  home = {
    packages = with pkgs; [
      cowsay
      sl
      lolcat

      # Nix language tools
      nil
      nixpkgs-fmt

      # C/C++ language tools
      clang-tools

      # Lua language tool
      lua-language-server

      # Typescript
      typescript-language-server

      # Bash
      bash-language-server

      # Rust
      rust-analyzer

      capitaine-cursors-themed
    ];

    username = "bjorn";
    homeDirectory = "/home/bjorn";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

  };

  # XDG configuration

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;


      desktop = "$HOME/desktop";
      download = "$HOME/downloads";
      templates = "$HOME/templates";
      publicShare = "$HOME/public";
      documents = "$HOME/documents";
      music = "$HOME/music";
      pictures = "$HOME/pictures";
      videos = "$HOME/videos";

      extraConfig = {
        XDG_PROJECTS_DIR = "$HOME/workspace";
      };
    };
  };
}
