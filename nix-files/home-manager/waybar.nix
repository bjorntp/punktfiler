{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      * {
        border: none;
        border-radius: 0px;
        font-family: "Inconsolata";
        font-size: 14px;
        min-height: 0;
        color: #ebdbb2;
      }
      window#waybar {
        border-bottom-style: inset;
        border-bottom: 2px solid #689d6a;
        background: #1d2021;
      }
      #workspaces,
      #clock,
      #custom-music,
      #window {
        font-weight: 800;
        margin-top: 1px;
      }
      #window {
        margin-left: 5px;
      }
      /* Workspace Buttons */
      #workspaces button label {
        color: #689d6a;
      }
      #workspaces button {
        color: #689d6a;
        border-bottom: 4px solid transparent;
      }
      #workspaces button.focused label {
        color: #1d2021;
      }
      #workspaces button.visible {
        border-bottom: 4px solid #689d6a;
      }
      #workspaces button.focused {
        background: #689d6a;
        border: none;
        border-bottom: 4px solid #689d6a;
      }
      #workspaces button.active {
        color: #fabd2f;
        border-bottom: 4px solid #fabd2f;
      }
      #mode {
        background-color: #cc241d;
        color: white;
      }
      #clock,
      #battery,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #tray,
      #mode,
      #idle_inhibitor {
        padding: 0 5px;
        margin: 0 5px;
      }
      #idle_inhibitor {
        padding: 0 10px;
      }
      #idle_inhibitor.activated {
        background-color: #689d6a;
        color: #1d2021;
      }
      #custom-music {
        color: #b8bb26;
        margin: 0 15px;
        padding: 0 20px;
        border-bottom: 4px solid #b8bb26;
      }
      #clock {
        margin: 0;
        /*color: #fabd2f;*/
        /*border-bottom: 1px solid #fabd2f;*/
      }
      #network.disconnected {
        color: #cc241d;
        border-bottom: 4px solid #cc241d;
      }
      #pulseaudio.muted {
        padding: 0 20px;
        color: #cc241d;
        border-bottom: 4px solid #cc241d;
      }
    '';
    settings = [{
      layer = "top";
      position = "top";
      height = 32;
      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ ];
      modules-right = [ "idle_inhibitor" "pulseaudio" "network" "memory" "battery" "tray" "clock" ];

      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = "";
          deactivated = "";
        };
      };

      "sway/mode" = {
        format = "<span style=\"italic\">{}</span>";
      };

      "tray" = {
        icon-size = 14;
        spacing = 10;
      };

      "clock" = {
        format-alt = "{:%A, %B %d at %I:%M %p}";
        format = "{:%Y-%m-%d - %H:%M}";
      };

      "cpu" = {
        format = "{usage}% ";
        on-click = "kitty -t 'Floating Terminal' -e htop";
      };

      "memory" = {
        interval = 30;
        format = "{used:0.1f}/{total:0.1f}G ";
      };

      "network" = {
        # "interface" = "wlp2s0"; # Uncomment to force the use of this interface
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ifname}: {ipaddr} ";
        format-disconnected = "Disconnected ⚠";
      };

      "pulseaudio" = {
        # "scroll-step" = 1; # Uncomment to enable scroll step
        format = "{volume}% {icon}";
        format-bluetooth = "{volume}% {icon}";
        "format-muted" = "";
        "format-icons" = {
          "headphones" = "";
          "handsfree" = "";
          "headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = [ "" "" ];
        };
        on-click = "pavucontrol";
      };

      # "custom/music" = {
      #   format = "  {}";
      #   max-length = 60;
      #   interval = 5;
      #   exec = "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null";
      #   tooltip = false;
      #   on-click = "playerctl play-pause";
      #   on-scroll-up = "playerctl previous";
      #   on-scroll-down = "playerctl next";
      # };
    }];
  };

  # Ensure the mediaplayer script exists
  # home.file.".config/waybar/mediaplayer.sh" = {
  #   # If you already have this script, you can use the source option:
  #   # source = ./path/to/your/mediaplayer.sh;
  #
  #   # Or you can create it with text:
  #   text = ''
  #     #!/bin/sh
  #
  #     player_status=$(playerctl status 2> /dev/null)
  #
  #     title=$(playerctl metadata title)
  #     if artist=$(playerctl metadata artist); then
  #         song_info="${title} By ${artist}"
  #     else
  #         song_info="${title}"
  #     fi
  #
  #
  #     if [ "$player_status" = "Playing" ]; then
  #         output="${song_info}"
  #     elif [ "$player_status" = "Paused" ] ; then
  #         output="⏸️ ${song_info}"
  #     fi
  #     echo $output
  #   '';
  #   executable = true;
  # };

  # Make sure the required packages are installed
  home.packages = with pkgs; [
    playerctl # For media controls
    pavucontrol # For pulseaudio control
    inconsolata # Font used in your config
  ];
}
