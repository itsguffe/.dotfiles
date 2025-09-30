{ pkgs, modulesPath, ... }: {

  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ./../system/apps/general.nix
    ../../system/desktop-environment/kde.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
