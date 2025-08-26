{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/general.nix
      ../../system/desktop-environment/kde.nix
      ../../system/locale.nix
      ../../users/guffe.nix
      ../../system/apps/general.nix
      ../../system/apps/games.nix
      ../../system/apps/development.nix
      ../../system/apps/work.nix
    ];

# Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/boot/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk = true;

  boot.initrd.luks.devices."luks-b02da843-81a5-43d9-ae49-df8420d67e96".keyFile = "/boot/crypto_keyfile.bin";


  networking.hostName = "nixtest";

  boot.supportedFilesystems = [ "ntfs" ];


  environment.systemPackages = with pkgs; [
    nextcloud-client
    mpv
    qmk
  ];

  system.stateVersion = "24.05";
}
