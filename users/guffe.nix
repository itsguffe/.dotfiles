{...}:

{
  #make "guffe" a configuration
  users.users.guffe = {
    isNormalUser = true;
    description = "guffe";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  #make this an option
  security.sudo.extraRules = [{
    users = ["guffe"];
    commands = [{ 
      command = "ALL";
      options = ["NOPASSWD"];
    }];
  }];
}
