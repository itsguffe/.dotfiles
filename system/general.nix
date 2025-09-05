{config, pkgs, ...}:

{
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.envfs.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    fzf
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
