{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreAllDups = true;
      share = true;
    };

    shellAliases = {
      ls = "ls --color=auto";
      upni = "sudo nixos-rebuild switch";
      upho = "home-manager switch";
    };

    initExtra = ''
      bindkey "^[[3~" delete-char
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      export PATH=/home/bjorn/.local/bin:$PATH
      function ranger-cd {
        local tempfile="$(mktemp -t ranger_cd.XXXXXXXXXX)"
        ranger --choosedir="$tempfile" "$@"
        if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(pwd)" ]]; then
          cd -- "$(cat "$tempfile")"
        fi
        rm -f -- "$tempfile"
      }
      alias ranger='ranger-cd'
    '';

    plugins = with pkgs; [
      # {
      #   # Deactivated due to slow start
      #   name = "zsh-z";
      #   file = "zsh-z.plugin.zsh";
      #   src = builtins.fetchGit {
      #     url = "https://github.com/agkozak/zsh-z";
      #     rev = "afaf2965b41fdc6ca66066e09382726aa0b6aa04";
      #   };
      # }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
    ];

    initExtraBeforeCompInit = ''

      autoload -U compinit;

    '';

  };
}
