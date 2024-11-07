{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/general.nix
      ../../hardware/audio.nix
      ../../hardware/bluetooth.nix
      ../../system/desktop-environment/kde.nix
      ../../system/locale.nix
      ../../users/guffe.nix
      ../../system/apps/general.nix
    ];

  networking.hostName = "maxter";

  system.stateVersion = "24.05";
}