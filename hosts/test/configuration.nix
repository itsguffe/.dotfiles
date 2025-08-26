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

  networking.hostName = "nixtest";

  boot.supportedFilesystems = [ "ntfs" ];


  environment.systemPackages = with pkgs; [
    nextcloud-client
    mpv
    qmk
  ];

  system.stateVersion = "24.05";
}
