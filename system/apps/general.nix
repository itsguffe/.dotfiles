{config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vesktop
    spotify
    vim
    git
    fzf
    unrar
    lazygit
  ];
  
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.envfs.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
  ];

  programs.fish = {
  enable = true;
  shellInit = ''
    function gco
    set branch (begin; git branch; git branch -r; end | sed 's/origin\///' | sort -u | fzf)
    set branch (string trim $branch)  # remove leading/trailing whitespace
    if test -n "$branch"
        git checkout $branch
    end
end

    function gsa
        set stash (git stash list | fzf)
        if test -n "$stash"
            set stash_index (echo $stash | sed -E 's/stash@\{([0-9]+)\}.+/\1/')
            git stash apply stash@{$stash_index}
        end
    end
  '';
};
  
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
