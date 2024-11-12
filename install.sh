#!/usr/bin/env bash

read -p "Enter 1 for laptop or 2 for desktop: " type

if [ $type = "1" ]; then
  ./laptop_packages.sh
elif [ $type = "2" ]; then
  ./desktop_packages.sh
else
  echo "Invalid input, exiting"
  exit
fi

sudo systemctl enable sddm
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo chsh -s /bin/zsh $USER

# Variables
_i3="$HOME/.config/i3"
_rofi="$HOME/.config/rofi"
_rofi_theme="$HOME/.local/share/rofi/themes"
_kitty="$HOME/.config/kitty"
_polybar="$HOME/.config/polybar"
_picom="$HOME/.config/picom"
_wallpaper="$HOME/pictures/"
_home="$HOME/"
_neovim="$HOME/.config/nvim"
_zshplugins="$HOME/.local/zsh-plugins/"

mkdir -p "$_i3" "$_rofi" "$_rofi_theme" "$_polybar" "$_picom" "$_kitty" "$_wallpaper" "$_config"
echo "Created directories"

# Configs
if [ $type = "1" ]; then
  echo "Running laptop installation"
  cp -r "configs/i3/laptop/"* "$_i3" && echo "Copying i3 config"
  cp -r "configs/polybar/laptop/"* "$_polybar" && echo  "Copying polybar config and scripts"
  cp "configs/picom/laptop/picom.conf" "$_picom" && echo  "Copying picom config"
  sudo cp "./configs/xorg.conf.d/laptop/40-libinput.conf" "/usr/share/X11/xorg.conf.d/40-libinput.conf"
elif [ $type = "2" ]; then
  echo "Running desktop installation"
  cp -r "configs/i3/desktop/"* "$_i3" && echo "Copying i3 config"
  cp -r "configs/polybar/desktop/"* "$_polybar" && echo  "Copying polybar config and scripts"
  cp "configs/picom/desktop/picom.conf" "$_picom" && echo  "Copying picom config"
  sudo cp "./configs/xorg.conf.d/desktop/40-libinput.conf" "/usr/share/X11/xorg.conf.d/40-libinput.conf"
fi

echo "Copying kitty config" && cp "configs/kitty/"* "$_kitty" 
echo "Copying rofi config" && cp "configs/rofi/config.rasi" "$_rofi" 
echo "Copying rofi theme" && -r "configs/rofi/themes/"* "$_rofi_theme" 
echo "Copying wallpaper" && cp "wallpapers/cat_wall.png" "$_wallpaper" 
echo "Cloning Neovim config and removing .git file" && git clone git@github.com:bjorntp/neovim.git "$_neovim" && rm "$_neovim/.git"
echo "Copying zsh config" && cp "configs/zsh/.zshrc" "$_home"
echo "Cloing zsh plugins from Github"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$_zshplugins/powerlevel/"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$_zshplugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$_zshplugins"
git clone https://github.com/zsh-users/zsh-history-substring-search.git "$_zshplugins"
git clone https://github.com/agkozak/zsh-z.git "$_zshplugins"

# git clone https://github.com/catppuccin/sddm.git
# sudo cp -r "./sddm/src/catppuccin-mocha" "/usr/share/sddm/themes/" 
# sudo cp "./configs/sddm/sddm.conf" "/etc/sddm.conf"
# sudo rm -r sddm

fastfetch
