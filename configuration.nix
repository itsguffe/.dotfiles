{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware/amd-drivers.nix
      ./hardware/bluetooth.nix
      ./system/locale.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixter"; # Define your hostname.

  networking.networkmanager.enable = true;

  drivers.amdgpu.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "startplasma-x11";
  services.xrdp.openFirewall = true;

  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  #programs.hyprland.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.guffe = {
    isNormalUser = true;
    description = "guffe";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  security.sudo.extraRules = [{
    users = ["guffe"];
    commands = [{ 
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];

  programs.firefox.enable = true;

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

  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    pkgs.nix-ld
    vesktop
    spotify
    runelite
    neovim
    kdePackages.kate
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };


  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05";
}
