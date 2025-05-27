if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ls='eza --no-time'
    alias lg='lazygit'
    alias cat='bat'

    # Add ~/.local/bin to PATH
    set -x PATH $HOME/.local/bin $PATH

    # Set editor
    set -gx EDITOR nvim

    # Enable vim key bindings
    fish_vi_key_bindings

    set fish_greeting
end
