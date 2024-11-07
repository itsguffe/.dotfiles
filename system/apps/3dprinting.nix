{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    (callPackage ./cura5 {})
  ];
}
