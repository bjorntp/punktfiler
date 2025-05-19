{ config, lib, pkgs, ... }:

let
  toggleScript = pkgs.writeShellScriptBin "toggle_dwindle_master" ''
    #!/usr/bin/env bash
    # Toggle between Master and Dwindle layout
    if  [[ $(hyprctl getoption general:layout) == *'master'* ]]; then
      hyprctl keyword general:layout dwindle
    else
      hyprctl keyword general:layout master 
    fi
  '';
in

{

  home.packages = [ toggleScript ];
  wayland.windowManager.hyprland = {
    enable = true;

    # Settings are organized in a similar structure to your original config
    settings = {
      # MONITORS
      monitor = [
        ",highres,auto,1"
      ];

      # MY PROGRAMS (defining variables in Nix)
      "$terminal" = "kitty";
      "$fileManager" = "kitty ranger";
      "$menu" = "rofi --show drun";

      # AUTOSTART
      exec-once = [
        "waybar & hyprpaper"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hyprctl setcursor \"Capitaine Cursors (Gruvbox)\" 24"
      ];

      # ENVIRONMENT VARIABLES
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      # LOOK AND FEEL
      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true; # "yes, please :)" is converted to true

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0" # Note: Removed the "#fffff" comment
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        mfact = 0.75;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      # INPUT
      input = {
        kb_layout = "se";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      # KEYBINDINGS
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, E, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, $menu -show run"
        "$mainMod, P, pseudo,"
        "$mainMod, O, togglesplit,"

        # Vim-like focus movement
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Vim-like window movement
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        # Resize
        "$mainMod CTRL, H, resizeactive, -20 0"
        "$mainMod CTRL, L, resizeactive, 20 0"
        "$mainMod CTRL, K, resizeactive, 0 -20"
        "$mainMod CTRL, J, resizeactive, 0 20"

        # Arrow key focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Workspace switching
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to workspace
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Toggle layouts
        "$mainMod, M, exec, toggle_dwindle_master"

        "$mainMod, N, layoutmsg, rollnext"
        "$mainMod, P, layoutmsg, rollprev"

        # Screenshots
        ", print, exec, grim /home/bjorn/pictures/screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
        "$mainMod, print, exec, grim -g \"$(slurp)\" /home/bjorn/pictures/screenshots/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
        "$mainMod SHIFT, print, exec, grim -g \"$(slurp)\" - | wl-copy -t image/png"

        # Clipboard
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # Lock screen
        "CTRL + ALT, l, exec, hyprlock"

        # Full brightness
        "bind = $mainMod ,XF86MonBrightnessUp, exec, brightnessctl s 100%"
        "bind = $mainMod ,XF86MonBrightnessDown, exec, brightnessctl s 1"

      ];

      # Media key bindings and brightness
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Window and dragging bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Window rules
      windowrulev2 = "suppressevent maximize, class:.*";
    };
  };
}
