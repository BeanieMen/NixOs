{ config, pkgs, ... }:

{
  home.packages = [ pkgs.rofi ];

  xdg.configFile."rofi" = {
    source = ../dotfiles/rofi;
    recursive = true;
  };
}
