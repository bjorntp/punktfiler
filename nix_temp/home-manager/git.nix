{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "bjorntp";
    userEmail = "bjorn@tenje.se";
  };
}
