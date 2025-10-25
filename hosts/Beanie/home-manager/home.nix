{ config, pkgs, ... }:

{
  home.username = "aj";
  home.homeDirectory = "/home/aj";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  xsession.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.hack
    vim
    wget
    neovim
    git
    alacritty
    dmenu
    xorg.xinit
    firefox
    pfetch
    feh
    sxiv
    polybar
    pipes
    ranger
    discord
    pavucontrol
    maim
    killall
    audacity
    google-chrome
    mumble
    xclip
    obs-studio
    ffmpeg
    mpv
    gimp
    lxappearance
    unzip
    nixfmt-classic
    gh
    vim
    git
    wget
    unzip
    cmake
    ninja
    clang
    lld
    gnumake
    python3

    androidsdk
    androidenv.androidPkgs.platform-tools
    androidenv.androidPkgs.ndk-bundle
  ];
  imports = [ ./nix.conf ../../../modules/picom.nix ];
}
