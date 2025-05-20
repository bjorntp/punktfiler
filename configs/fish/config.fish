if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ls='eza --no-time'

    # Add ~/.local/bin to PATH
    set -x PATH $HOME/.local/bin $PATH

    # Enable vim key bindings
    fish_vi_key_bindings
end
