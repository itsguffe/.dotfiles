{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    jetbrains.rider
    devenv
    dotnet-sdk
  ];
}
