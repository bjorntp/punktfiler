#!/bin/bash

# List of directories to stow
DIRS=("fish" "hypr" "kitty" "lazygit" "ranger" "rofi" "waybar")

for dir in "${DIRS[@]}"; do
  if [ -d "$dir" ]; then
    echo "Stowing $dir..."
    stow -v -t ~ "$dir"
  else
    echo "Warning: Directory '$dir' does not exist in $(pwd), skipping."
  fi
done

echo "Done."
