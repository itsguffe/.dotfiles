{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/general.nix
      ../../hardware/amd-drivers.nix
      ../../hardware/audio.nix
      ../../hardware/bluetooth.nix
      ../../system/desktop-environment/kde.nix
      ../../system/locale.nix
      ../../users/guffe.nix
      ../../system/apps/general.nix
      ../../system/apps/games.nix
      ../../system/apps/development.nix
      ../../system/apps/3dprinting.nix
      ../../system/apps/work.nix
    ];

  networking.hostName = "nixter";

  boot.supportedFilesystems = [ "ntfs" ];

  drivers.amdgpu.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    nextcloud-client
    mpv
    qmk
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = "24.05";
}
