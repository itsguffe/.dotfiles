{ pkgs, ... }:

{
  hardware.graphics.enable32Bit = true;

  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true; 
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libkrb5
        keyutils
      ];
    };
  };

  environment.systemPackages = [
    pkgs.runelite
    pkgs.lutris
  ];
  services.flatpak.enable = true;
  programs.gamemode.enable = true;
}
