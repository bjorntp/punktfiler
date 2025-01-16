#!/usr/bin/env bash

# Variables
_i3="$HOME/.config/i3"
_rofi="$HOME/.config/rofi"
_rofi_theme="$HOME/.local/share/rofi/themes"
_kitty="$HOME/.config/kitty"
_polybar="$HOME/.config/polybar"
_picom="$HOME/.config/picom"
_wallpaper="$HOME/pictures/"
_home="$HOME/"
_waybar="$HOME/.config/waybar/"
_hypr="$HYPR/.config/hypr"

read -p "Enter 1 for laptop or 2 for desktop: " computer_type
read -p "Enter 1 for hyprland or 2 for i3: " wm_type 

if [ $computer_type = "1" ]; then
  if [ $wm_type = "1" ]; then
    ./package_directories/laptop_packages_hyprland.sh
  elif $wm_type = "2" ]; then
    ./package_directories/laptop_packages_i3.sh
  else 
    echo "Invalid input, exiting"
    exit
  fi
elif [ $computer_type = "2" ]; then
  if [ $wm_type = "1" ]; then
    ./package_directories/desktop_packages_hyprland.sh
  elif $wm_type = "2" ]; then
    ./package_directories/desktop.sh
  else 
    echo "Invalid input, exiting"
    exit
  fi
else
  echo "Invalid input, exiting"
  exit
fi

sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo chsh -s /bin/zsh $USER

#  computer_type 1 = laptop, 2 = desktop
#  wm_type 1 = hyprland, 2 = i3 

mkdir -p -v "$_rofi" "$_rofi_theme" "$_kitty" "$_wallpaper" "$_config" "$_nvim"
mkdir -p -v "$_i3" "$_polybar" "$_picom" 
echo "Created directories"


if [ $computer_type = "1" ]; then
  if [ $wm_type = "1" ]; then # Laptop hyprland
    echo "Running laptop hyprland installation"
    echo "Copying hyprland config" && cp -r "configs/hypr/laptop"* "$_hypr"
    echo "Copying waybar config" && cp -r "configs/waybar/"* "$_waybar"
  elif [ $wm_type = "2" ]; then # Laptop i3
    echo "Running laptop i3 installation"
    echo "Copying i3 config" && cp -r "configs/i3/laptop/"* "$_i3"
    echo "Copying polybar config and scripts" && cp -r "configs/polybar/laptop/"* "$_polybar"
    echo "Copying picom config" && cp "configs/picom/laptop/picom.conf" "$_picom"
    sudo cp "./configs/xorg.conf.d/laptop/40-libinput.conf" "/usr/share/X11/xorg.conf.d/40-libinput.conf"
  fi
elif [ $computer_type = "2" ]; then
  if [ $wm_type = "1" ]; then # Desktop hyprland
    echo "Running laptop hyprland installation"
    echo "Copying hyprland config" && cp -r "configs/hypr/desktop/"* "$_hypr"
    echo "Copying waybar config" && cp -r "configs/waybar/"* "$_waybar"
  elif [ $wm_type = "2" ]; then # Desktop i3
    echo "Running desktop installation"
    echo "Copying i3 config" && cp -r "configs/i3/desktop/"* "$_i3"
    echo "Copying polybar config and scripts" && cp -r "configs/polybar/desktop/"* "$_polybar"
    echo "Copying picom config" && cp "configs/picom/desktop/picom.conf" "$_picom"
    sudo cp "./configs/xorg.conf.d/desktop/40-libinput.conf" "/usr/share/X11/xorg.conf.d/40-libinput.conf"
  else 
    echo "Invalid input, exiting"
    exit
  fi
fi

echo "Setting zathura as default pdf viewer" && xdg-mime default org.pwmt.zathura.desktop application/pdf
echo "Cloning Neovim config" && git clone https://github.com/bjorntp/neovim "$_nvim"
echo "Copying kitty config" && cp "configs/kitty/"* "$_kitty" 
echo "Copying rofi config" && cp "configs/rofi/config.rasi" "$_rofi" 
echo "Copying rofi theme" && -r "configs/rofi/themes/"* "$_rofi_theme" 
echo "Copying wallpaper" && cp "wallpapers/cat_wall.png" "$_wallpaper" 

fastfetch
