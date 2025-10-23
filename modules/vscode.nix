{ config, pkgs, ... }:

{
  home.packages = [ pkgs.vscode ];

  xdg.configFile."Code/User/settings.json" = {
    text = ''
      {
        "files.autoSave": "afterDelay",
        "files.autoSaveDelay": 100
      }
    '';
  };
}