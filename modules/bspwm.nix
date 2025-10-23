{
  xdg.configFile."bspwm/walls" = {
    source = ../walls;
    recursive = true; 
  };

  xsession.windowManager.bspwm = {
    enable = true;
    extraConfig = ''
      sxhkd &
      pkill picom
      picom --experimental-backends &
      feh --bg-fill "$(find ~/.config/bspwm/walls -xtype f | shuf -n1)"
      ~/.config/polybar/launch.sh 

      bspc monitor -d 1 2 3 4 5 6 7 8 9 10 11

      bspc config border_width 0 
      bspc config window_gap 9
      bspc config pointer_follows_monitor true
      bspc config focus_follows_pointer true

      bspc rule -a mumble state=floating follow=on focus=on
    '';
  };
}
