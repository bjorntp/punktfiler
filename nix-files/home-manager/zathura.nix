{ pkgs, lib, ... }:
{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipoard";
      font = "FiraCodeNerdFont Normal 12";
    };
  };
}
