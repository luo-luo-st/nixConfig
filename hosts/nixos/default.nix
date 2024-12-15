
{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/sysgnome.nix
      ../../pkgs/variables.nix
      ../../pkgs/kanata.nix
      ../../pkgs/i18ninput
    ];
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
}


