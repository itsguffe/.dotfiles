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
      ../../system/apps/3dprinting.nix
    ];

  networking.hostName = "nixter";

  drivers.amdgpu.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  system.stateVersion = "24.05";
}
