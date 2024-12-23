{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanager-openvpn
    freerdp3
  ];
}
