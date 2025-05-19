{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "Fira Code";
    settings = {
      shell_integration = "no-rc";
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      dynamic_background_opacity = "yes";
      window_padding_width = 0;
      include = "current-theme.conf";
    };
    keybindings = {
      "ctrl+shift+enter" = "launch --cwd current --type os-window";
    };
  };

  # Create theme files in the right location
  xdg.configFile = {
    "kitty/light-theme.auto.conf".text = ''
      ## name: Gruvbox Light Hard
      ## author: Pavel Pertsev
      ## license: MIT/X11
      ## upstream: https://raw.githubusercontent.com/gruvbox-community/gruvbox-contrib/master/kitty/gruvbox-light-hard.conf

      selection_foreground    #3c3836
      selection_background    #d65d0e

      background              #f9f5d7
      foreground              #3c3836

      color0                  #ebdbb2
      color1                  #cc241d
      color2                  #98971a
      color3                  #d79921
      color4                  #458588
      color5                  #b16286
      color6                  #689d6a
      color7                  #7c6f64
      color8                  #928374
      color9                  #9d0006
      color10                 #79740e
      color11                 #b57614
      color12                 #076678
      color13                 #8f3f71
      color14                 #427b58
      color15                 #282828

      cursor                  #665c54
      cursor_text_color       #bdae93

      url_color               #458588
    '';

    "kitty/dark-theme.auto.conf".text = ''
      ## name: Gruvbox Dark Hard
      ## author: Pavel Pertsev
      ## license: MIT/X11
      ## upstream: https://raw.githubusercontent.com/gruvbox-community/gruvbox-contrib/master/kitty/gruvbox-dark-hard.conf


      selection_foreground    #ebdbb2
      selection_background    #d65d0e

      background              #1d2021
      foreground              #ebdbb2

      color0                  #3c3836
      color1                  #cc241d
      color2                  #98971a
      color3                  #d79921
      color4                  #458588
      color5                  #b16286
      color6                  #689d6a
      color7                  #a89984
      color8                  #928374
      color9                  #fb4934
      color10                 #b8bb26
      color11                 #fabd2f
      color12                 #83a598
      color13                 #d3869b
      color14                 #8ec07c
      color15                 #fbf1c7

      cursor                  #bdae93
      cursor_text_color       #665c54

      url_color               #458588
    '';
    "kitty/no-preference-theme.auto.conf".text = ''
      ## name: Gruvbox Dark Hard
      ## author: Pavel Pertsev
      ## license: MIT/X11
      ## upstream: https://raw.githubusercontent.com/gruvbox-community/gruvbox-contrib/master/kitty/gruvbox-dark-hard.conf


      selection_foreground    #ebdbb2
      selection_background    #d65d0e

      background              #1d2021
      foreground              #ebdbb2

      color0                  #3c3836
      color1                  #cc241d
      color2                  #98971a
      color3                  #d79921
      color4                  #458588
      color5                  #b16286
      color6                  #689d6a
      color7                  #a89984
      color8                  #928374
      color9                  #fb4934
      color10                 #b8bb26
      color11                 #fabd2f
      color12                 #83a598
      color13                 #d3869b
      color14                 #8ec07c
      color15                 #fbf1c7

      cursor                  #bdae93
      cursor_text_color       #665c54

      url_color               #458588
    '';
  };
}
