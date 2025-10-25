{ config, pkgs, ... }:

{
  home.packages = [ pkgs.vscode ];

  programs.vscode = {
    enable = true;

    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        publisher = "bbenoist";
        name = "nix";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "brettm12345";
        name = "nixfmt-vscode";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "dsznajder";
        name = "es7-react-js-snippets";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "eamodio";
        name = "gitlens";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "github";
        name = "copilot";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "github";
        name = "copilot-chat";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "github";
        name = "vscode-pull-request-github";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "jdinhlife";
        name = "gruvbox";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "jnoortheen";
        name = "nix-ide";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "ms-vscode";
        name = "vscode-typescript-next";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "oderwat";
        name = "indent-rainbow";
        version = "latest";
        sha256 = null;
      }
      {
        publisher = "yoavbls";
        name = "pretty-ts-errors";
        version = "latest";
        sha256 = null;
      }
    ];

    userSettings = {
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 100;

      "[nix]" = { "editor.defaultFormatter" = "jnoortheen.nix-ide"; };

      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "gitlens.ai.model" = "vscode";
      "gitlens.ai.vscode.model" = "copilot:gpt-4.1";
    };
  };
}
