{ lib, pkgs, ... }:
{
  imports = [
    # ./zsh.nix
    ./zathura.nix
    ./fish.nix
    ./kitty.nix
    ./ssh.nix
    ./git.nix
    ./ranger.nix
    ./hyprland.nix
    ./hyprextra.nix
    ./waybar.nix
  ];
  home = {
    packages = with pkgs; [

      fish
      grc
      eza

      redshift

      nextcloud-client

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
      vscode-langservers-extracted
      tailwindcss-language-server

      # Bash
      bash-language-server

      # Rust
      rust-analyzer

      # Java
      jdt-language-server

      # Yaml-files
      yaml-language-server

      # Python
      pyright

      # Cursor theme
      capitaine-cursors-themed
    ];

    username = "bjorn";
    homeDirectory = "/home/bjorn";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";

      # Add these cursor-related variables
      XCURSOR_THEME = "Capitaine Cursors (Gruvbox)";
      XCURSOR_SIZE = "24";

      # For newer Hyprland versions
      HYPRCURSOR_THEME = "Capitaine Cursors (Gruvbox)";
      HYPRCURSOR_SIZE = "24";
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 24;
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      size = 24;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  # XDG configuration

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "$HOME/misc/desktop";
      download = "$HOME/downloads";
      templates = "$HOME/misc/templates";
      publicShare = "$HOME/misc/public";
      documents = "$HOME/misc/documents";
      music = "$HOME/misc/music";
      pictures = "$HOME/pictures";
      videos = "$HOME/videos";

      extraConfig = {
        XDG_PROJECTS_DIR = "$HOME/workspace";
        XDG_MOUNT_DIR = "$HOME/misc/mnt";
      };
    };
  };
}
