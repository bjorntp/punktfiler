# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

# Plugins
source ~/.local/zsh-plugins/powerlevel/powerlevel10k.zsh-theme
source ~/.local/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/zsh-plugins/zsh-z/zsh-z.plugin.zsh
source ~/.local/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.local/zsh-plugins/zsh-autopair/autopair.plugin.zsh

bindkey "^[[3~" delete-char

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## Aliases

# Find files arg1 is path, arg2 is a regular expression. Not case sensitive. Does not show error messages
fdshort() {
  find $1 -iregex $2 2>/dev/null
}

alias "ranger"=". ranger"
alias ls='eza --no-time'
alias lg='lazygit'
alias cat='bat'
alias bt='bluetui'
alias rundocker='systemctl start docker'
alias stopdocker='systemctl stop docker'
alias ps='procs'
alias ssh='kitty +kitten ssh'

export EDITOR='nvim'
