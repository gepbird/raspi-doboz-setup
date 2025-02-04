{ config, ... }:

{
  moe = {
    enable = true;
    group = "shared";
    openFirewall = true;
    settings = {
      status-port = 25571;
    };
    credentialsFile = config.age.secrets.moe.path;
  };

  age.secrets = {
    moe.file = ../secrets/moe.age;
  };

  services.borgmatic.configurations.raspi = {
    sqlite_databases = [
      {
        name = "moe";
        path = "/var/lib/moe/storage.db";
      }
    ];
  };
}
