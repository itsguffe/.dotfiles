{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/locale.nix
      ../../users/guffe.nix
      ../../system/general.nix
    ];

  networking.hostName = "nixters-lab";

  services.openssh.enable = true;

  services.guacamole-server = {
    enable = true;
    host = "127.0.0.1";
    userMappingXml = ./guacamole/user-mapping.xml;
  };

  services.guacamole-client = {
    enable = true;
    enableWebserver = true;
    settings = {
      guacd-port = 4822;
      guacd-hostname = "127.0.0.1";
    };
  };

  services.caddy.enable = true;
  services.caddy.configFile = pkgs.writeText "Caddyfile" ''
 http://guffe.org {
        reverse_proxy localhost:8080
   @notGuac {
     not path /guacamole*
   }
   redir @notGuac /guacamole/
   reverse_proxy localhost:8080 {
     flush_interval -1
   }
 }'';

  networking.firewall.allowedTCPPorts = [80 443];

  system.stateVersion = "24.05";
}
