{ config, pkgs, ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;               # build GRUB with EFI modules
      device = "nodev";                # don't install to MBR, only EFI
      useOSProber = true;

      extraInstallCommands = ''
        if [ -d /boot/efi ]; then
          echo "Detected /boot/efi — installing GRUB with boot-directory=/boot/efi"
          ${pkgs.grub2}/sbin/grub-install \
            --target=x86_64-efi \
            --efi-directory=/boot/efi \
            --boot-directory=/boot/efi \
            --directory=${pkgs.grub2}/lib/grub/x86_64-efi \
            --recheck \
            --removable \
            --no-nvram
        else
          echo "/boot/efi not present — skipping ESP-targeted grub-install"
        fi
      '';
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

}
