{ config, lib, pkgs, ... }:

{
  # Install hyprlock and hyprpaper packages
  home.packages = with pkgs; [
    hyprpaper
    hyprlock
  ];

  # Create configuration files for hyprlock and hyprpaper
  xdg.configFile = {
    # Hyprlock config
    "hypr/hyprlock.conf".text = ''
      background {
        monitor = eDP-1
        path = ${config.home.homeDirectory}/pictures/gruvboxrainbow.png
        blur_passes = 3
        blur_size = 5
      }
      
      input-field {
        monitor = eDP-1
        size = 300, 50
        position = 0, 0
        valign = center
        halign = center
        outline_thickness = 2
        outer_color = rgba(0, 0, 0, 0.5)
        inner_color = rgba(0, 0, 0, 0.7)
        font_color = rgb(200, 200, 200)
        placeholder_text = Password...
        dots_center = true
        fade_on_empty = true
        dots = true
      }
    '';

    # Hyprpaper config
    "hypr/hyprpaper.conf".text = ''
      preload = ${config.home.homeDirectory}/pictures/gruvboxrainbow.png
      wallpaper = eDP-1, ${config.home.homeDirectory}/pictures/gruvboxrainbow.png
      ipc = off
    '';
  };
}
