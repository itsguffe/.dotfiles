{config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.envfs.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    fzf
    nix-ld
    kitty
    unrar
  ];

  fonts.packages = with pkgs; [
    font-awesome
  ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

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
}
