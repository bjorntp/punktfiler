#!/bin/bash

# Toggle between Master and Dwindle layout
if  [[ $(hyprctl getoption general:layout) == *'master'* ]]; then
  hyprctl keyword general:layout dwindle
else
  hyprctl keyword general:layout master 
fi
