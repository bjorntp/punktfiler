{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "foreign-env";
        src = pkgs.fishPlugins.foreign-env.src;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge.src;
      }
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
    shellAbbrs = {
      ls = "eza --no-time";
      e = "nvim";
      c = "ssh";
      home = "home-manager switch";
      reb = "sudo nixos-rebuild switch";
      latest = "git log | head -1 | awk '{print $2;}'";
    };
    interactiveShellInit =
      ''
        fish_vi_key_bindings
        set fish_greeting # Disable greeting
      '';

    functions = {
      ranger = ''
        set -l IFS
        set -l tempfile (mktemp -t tmp.XXXXXX)
        command ranger --choosedir=$tempfile $argv
        if test -f $tempfile && test (cat $tempfile) != (pwd)
          cd (cat $tempfile)
        end
        rm -f $tempfile
      '';
    };
  };
}
