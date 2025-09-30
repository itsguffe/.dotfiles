{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    networkmanager
    remmina
  ];
  networking.networkmanager.plugins = [
    pkgs.networkmanager-openvpn
  ];
}
