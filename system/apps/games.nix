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
  ];
  services.flatpak.enable = true;
  programs.gamemode.enable = true;

  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", TAG+="uaccess"
  '';
  services.input-remapper.enable = true;
  # Optional: enable udev rules (for hotplug support)
  services.input-remapper.enableUdevRules = true;
  # (optional) Adjust which systemd target the service depends on
  services.input-remapper.serviceWantedBy = [ "graphical.target" ];
}
