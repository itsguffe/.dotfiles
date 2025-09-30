{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../hardware/amd-drivers.nix
      ../../hardware/audio.nix
      ../../hardware/bluetooth.nix
      ../../system/desktop-environment/kde.nix
      ../../system/locale.nix
      ../../users/guffe.nix
      ../../system/apps/general.nix
      ../../system/apps/games.nix
      ../../system/apps/development.nix
      ../../system/apps/work.nix
    ];

  networking.hostName = "nixter";

  boot.supportedFilesystems = [ "ntfs" ];

  drivers.amdgpu.enable = true;

  environment.systemPackages = with pkgs; [
    mpv
    qmk
  ];

  system.stateVersion = "24.05";
}
