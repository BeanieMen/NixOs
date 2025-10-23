{ config, pkgs, ... }:

{
  home.packages = [ pkgs.polybar ];

  xdg.configFile."polybar" = {
    source = ../dotfiles/polybar;
    recursive = true;
  };
}
