# packages.nix
{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Fonts
    jetbrains-mono
    nerdfonts
    fira
    fira-code
    fira-code-symbols
    noto-fonts
    noto-fonts-emoji

  ];

  environment.systemPackages = with pkgs;
    [
      # Core tools
      sudo
      git
      zsh
      curl
      wget
      less
      man
      home-manager

      # Editors
      vim
      neovim

      # Terminal
      kitty
      konsole
      fastfetch
      ripgrep
      mlocate
      lazygit
      ranger
      tree
      eza
      grc
      fish

      # Desktop apps
      firefox
      vlc
      gimp
      signal-desktop
      discord
      thunderbird
      obsidian
      spotify
      vscode
      pavucontrol
      nextcloud-client

      # System utilites
      brightnessctl
      libnotify
      xorg.xrandr
      gnumake
      unzip
      htop
      killall

      # Wayland (Hyprland) tools
      hyprland
      hyprpaper
      hyprlock
      waybar
      wl-clipboard
      grim
      slurp
      rofi

      # Bluetooth
      bluez
      # bluez-utils
      bluetui

      # Nix and bash language tools since they're edited by root sometimes
      nil
      nixpkgs-fmt
      bash-language-server

      # PDF & doc tools
      zathura
      # zathura-pdf-mupdf
      # zathura-cb
      pdfgrep

      # Dev tools
      gcc
      jdk
      python3
      nodejs
      cargo
      go
      luarocks

      # composer
      php
      julia

      # Gnome keyring (for secrets)
      gnome-keyring
      seahorse

      # LaTeX (optional: can be a big closure)
      texlive.combined.scheme-full

    ];

}
