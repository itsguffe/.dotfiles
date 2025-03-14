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

  boot.supportedFilesystems = [ "ntfs" ];

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

  services.caddy = {
    enable = true;
    configFile = ./caddy/caddyfile;
  };

  environment.etc."nextcloud-admin-pass".text = "VeryNiceP@ss123";
  services.nextcloud = {
    https = true;    
    enable = true;
    package = pkgs.nextcloud30;
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) calendar deck;
    };
    hostName = "localhost";
    settings = {
      trusted_proxies = ["localhost" "next.guffe.org" "127.0.0.1"];
      trusted_domains = ["next.guffe.org"];
    };
    config.adminpassFile = "/etc/nextcloud-admin-pass";
  };

  services.nginx.virtualHosts."localhost".listen = [ 
    {
      addr = "127.0.0.1"; 
      port = 8009;
    }
  ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    port = 5432;
     authentication = pkgs.lib.mkOverride 10 ''
    #type database DBuser origin-address auth-method
    local all      all     trust
    # ... other auth rules ...

    # ipv4
    host  all      all     127.0.0.1/32   trust
    # ipv6
    host  all      all     ::1/128        trust

    host  all      all     192.168.0.155/32 trust 
  '';
  };

  networking.firewall.allowedTCPPorts = [80 443 5432];

  system.stateVersion = "24.05";
}
