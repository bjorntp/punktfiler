# packages.nix
{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Fonts
    jetbrains-mono

    fira
    fira-code
    fira-code-symbols
    noto-fonts
    noto-fonts-emoji

  ];

	environment.systemPackages = with pkgs; 
	[
    # Core tools
    sudo git zsh curl wget less man home-manager

    # Editors
    vim neovim

    # Terminal
    kitty konsole fastfetch ripgrep mlocate lazygit ranger tree

    # Desktop apps
    firefox vlc gimp signal-desktop discord thunderbird obsidian spotify vscode

    # System utilites
    brightnessctl
    libnotify
    xorg.xrandr
    gnumake
    unzip
    htop

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

    # Network
    # networkmanager

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
