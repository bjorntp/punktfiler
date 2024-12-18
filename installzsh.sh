#!/usr/bin/env bash

sudo chsh -s /bin/zsh $USER
_zshplugins="$HOME/.local/zsh-plugins/"

mkdir -p -v "$_zshplugins"
echo "Created directories"
echo "Copying zsh config" && cp "configs/zsh/.zshrc" "$_home"
echo "Cloing zsh plugins from Github"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$_zshplugins/powerlevel/"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$_zshplugins/zsh-syntax-highlighting/"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$_zshplugins/zsh-autosuggestions/"
git clone https://github.com/zsh-users/zsh-history-substring-search.git "$_zshplugins/zsh-history-substring-search/"
git clone https://github.com/agkozak/zsh-z.git "$_zshplugins/zsh-z"
