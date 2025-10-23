{ config, pkgs, ... }: {
  services.picom = {
    enable = true;
    package = pkgs.picom;

    backend = "glx";
    vSync = true;

    # Disable fading in favor of animations
    fade = false;

    # Enhanced opacity settings
    activeOpacity = 0.95;
    inactiveOpacity = 0.85;
    opacityRules = [
      "95:class_g = 'rofi'"
      "90:class_g = 'thunar'"
      "95:class_g = 'spotify'"
      "95:class_g = 'discord'"
      "98:class_g = 'code'"
      "90:class_g = 'org.wezfurlong.wezterm'"
      "100:class_g = 'firefox'"
      "100:fullscreen"
    ];

    # Window exclusion rules
    shadowExclude = [
      "window_type = 'notification'"
      "window_type = 'dock'"
      "window_type *= 'menu'"
      "_GTK_FRAME_EXTENTS@:c"
    ];

    settings = {
      # Performance and rendering settings
      glx-no-stencil = true;
      glx-copy-from-font = false;
      use-damage = true;

      # Enhanced blur settings
      frame-opacity = 0.95;
      blur-background = true;
      blur-method = "dual_kawase";
      blur-strength = 8;
      blur-background-fixed = false;
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
        "class_g = 'firefox' && window_type != 'popup_menu'"
      ];

      # Rounded corners
      corner-radius = 12;
      round-borders = 1;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "window_type = 'notification'"
        "class_g = 'firefox' && window_type = 'utility'"
      ];

      # Window transitions
      transition-length = 300;
      transition-pow-x = 0.3;
      transition-pow-y = 0.3;
      transition-pow-w = 0.3;
      transition-pow-h = 0.3;
      size-transition = true;
      
      # Window opening/closing effects
      spawn-center = true;
      no-scale-down = true;

      # Animation excludes
      transition-exclude = [
        "window_type = 'dropdown_menu'"
        "window_type = 'popup_menu'"
        "window_type = 'tooltip'"
        "window_type = 'notification'"
        "window_type = 'dock'"
        "class_g = 'firefox' && window_type = 'utility'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      # Shadows for depth
      shadow = true;
      shadow-radius = 12;
      shadow-opacity = 0.75;
      shadow-offset-x = -12;
      shadow-offset-y = -12;
    };
  };
}
