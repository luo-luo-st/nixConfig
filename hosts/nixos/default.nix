
{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/hyprland.nix
      ../../modules/sql/postgreSQL.nix
      ../../pkgs/variables.nix
      ../../pkgs/kanata.nix
      ../../pkgs/i18ninput
    ];
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  virtualisation.vmware.guest.enable = true;
}


