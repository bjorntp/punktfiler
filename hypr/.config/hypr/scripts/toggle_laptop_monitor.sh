#!/bin/bash

# If more than one screen is connected and enabled (one screen more than the laptop is enough)
if [[ $(hyprctl monitors|grep "disabled: false") > 1 ]]; then
  # If monitor screen is enabled
  if  [[ $(hyprctl monitors|grep  -A 20 "eDP-1"|grep "disabled: false"|wc -l) == 1 ]]; then
    # Then disable it
    hyprctl keyword monitor eDP-1,disable
    echo "Disabled laptop monitor"
  else
    hyprctl keyword monitor eDP-1,1920x1080@60,0X0,1
    echo "Enabled laptop monitor"
  fi
fi

