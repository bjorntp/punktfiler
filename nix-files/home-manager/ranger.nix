{ config, pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    settings = {
      viewmode = "miller";
      column_ratios = "1,3,4";
      show_hidden = false;
      preview_images_method = "kitty";
      preview_files = "true";
      draw_borders = "both";
    };
  };
}
