{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.extra-experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "beanie";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.bspwm.enable = true;
  };


  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.aj = {
    isNormalUser = true;
    description = "Aarjav";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
