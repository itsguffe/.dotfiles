{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    jetbrains.rider
    devenv
    dotnetCorePackages.sdk_9_0-bin
    claude-code
  ];
}
