{ config, pkgs, ... }:
{
  users.users.bjorn = {
    isNormalUser = true;
    description = "Björn Tenje Persson";
    extraGroups = [ "networkmanager" "wheel" ]; # Note: fixed the group name from networkManager to networkmanager
    shell = pkgs.zsh;
  };
}
